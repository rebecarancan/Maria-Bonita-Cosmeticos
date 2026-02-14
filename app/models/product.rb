class Product < ApplicationRecord
  # Validations
  validates :code, :name, presence: true
  # Rails Money
  monetize :cost_cents

  # Search
  include SqliteSearch
  search_scope(:code, :name)
end
