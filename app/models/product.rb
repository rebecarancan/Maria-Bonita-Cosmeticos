class Product < ApplicationRecord
  # Rails Money
  monetize :price_cents, :cost_cents
end
