class Product < ApplicationRecord

  # Validations
  validates :code, :name, presence: true
  # Rails Money
  monetize :cost_cents

  # Search
  include PgSearch
  pg_search_scope :search_by_text, against: [:code, :name],
    using: {
      tsearch: {
        prefix: true
      }
    }

end
