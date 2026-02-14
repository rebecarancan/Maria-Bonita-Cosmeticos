module SqliteSearch
  extend ActiveSupport::Concern

  class_methods do
    def search_scope(*attrs)
      @@search_scope_attrs = attrs
    end

    def delete_search_index(*ids)
      target_ids = Array(ids)
      scope_foreign_key = to_s.foreign_key

      delete_where = target_ids.any? ? "WHERE #{scope_foreign_key} IN (#{target_ids.join(', ')})" : ''
      sql_delete = <<~SQL.strip
        DELETE FROM fts_#{table_name} #{delete_where};
      SQL
      connection.execute(sql_delete)
    end

    def rebuild_search_index(*ids)
      target_ids = Array(ids)
      target_ids = self.ids if target_ids.empty?

      scope_foreign_key = to_s.foreign_key

      delete_where = target_ids.any? ? "WHERE #{scope_foreign_key} IN (#{target_ids.join(', ')})" : ''
      sql_delete = <<~SQL.strip
        DELETE FROM fts_#{table_name} #{delete_where};
      SQL
      connection.execute(sql_delete)

      target_ids.each do |id|
        record = where(id: id).pluck(*@@search_scope_attrs, :id).first
        next unless record.present?

        id = record.pop

        sql_insert = <<~SQL.strip
          INSERT INTO fts_#{table_name}(#{@@search_scope_attrs.join(', ')}, #{scope_foreign_key})
          VALUES (#{record.map { |value| "'#{quote_string(value.to_s)}'" }.join(', ')}, #{id});
        SQL
        connection.execute(sql_insert)
      end
    end

    def quote_string(s)
      s.to_s.gsub('\\', '\&\&').gsub("'", "''")
    end
  end

  private def update_search_index
    table_name = self.class.table_name
    foreign_key = self.class.to_s.foreign_key

    search_attrs = @@search_scope_attrs.each_with_object({}) do |attr, acc|
      acc[attr] = send(attr) || ''
    end

    sql_delete = <<~SQL.strip
      DELETE FROM fts_#{table_name} WHERE #{foreign_key} = #{id};
    SQL
    self.class.connection.execute(sql_delete)

    sql_insert = <<~SQL.strip
      INSERT INTO fts_#{table_name}(#{search_attrs.keys.join(', ')}, #{foreign_key})
      VALUES (#{search_attrs.values.map { |value| "'#{self.class.quote_string(value.to_s)}'" }.join(', ')}, #{id});
    SQL
    self.class.connection.execute(sql_insert)
  end

  private def delete_from_search_index
    table_name = self.class.table_name
    foreign_key = self.class.to_s.foreign_key

    sql_delete = <<~SQL.strip
      DELETE FROM fts_#{table_name} WHERE #{foreign_key} = #{id};
    SQL
    self.class.connection.execute(sql_delete)
  end

  included do
    after_save :update_search_index
    after_destroy :delete_from_search_index

    scope_foreign_key = to_s.foreign_key
    table_name_str = table_name

    scope :full_search, lambda { |query|
      return none if query.blank?

      sanitized_query = connection.quote(query)
      sql = <<~SQL.strip
        SELECT #{scope_foreign_key} AS id FROM fts_#{table_name_str}
        WHERE fts_#{table_name_str} MATCH #{sanitized_query} ORDER BY rank;
      SQL
      ids = connection.execute(sql).map(&:values).flatten
      where(id: ids)
    }

    scope :full_search_prefix, lambda { |query|
      return none if query.blank?

      sanitized_query = connection.quote("#{query}*")
      sql = <<~SQL.strip
        SELECT #{scope_foreign_key} AS id FROM fts_#{table_name_str}
        WHERE fts_#{table_name_str} MATCH #{sanitized_query} ORDER BY rank;
      SQL
      ids = connection.execute(sql).map(&:values).flatten
      where(id: ids)
    }
  end
end
