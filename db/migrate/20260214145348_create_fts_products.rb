class CreateFtsProducts < ActiveRecord::Migration[8.0]
  def up
    execute('CREATE VIRTUAL TABLE fts_products USING fts5(code, name, product_id)')
    execute("CREATE TRIGGER fts_products_ai AFTER INSERT ON products BEGIN
      INSERT INTO fts_products(rowid, code, name, product_id)
      VALUES (new.id, new.code, new.name, new.id);
    END")
    execute("CREATE TRIGGER fts_products_ad AFTER DELETE ON products BEGIN
      DELETE FROM fts_products WHERE product_id = old.id;
    END")
    execute("CREATE TRIGGER fts_products_au AFTER UPDATE ON products BEGIN
      DELETE FROM fts_products WHERE product_id = old.id;
      INSERT INTO fts_products(rowid, code, name, product_id)
      VALUES (new.id, new.code, new.name, new.id);
    END")
  end

  def down
    execute('DROP TRIGGER IF EXISTS fts_products_au')
    execute('DROP TRIGGER IF EXISTS fts_products_ad')
    execute('DROP TRIGGER IF EXISTS fts_products_ai')
    execute('DROP TABLE IF EXISTS fts_products')
  end
end
