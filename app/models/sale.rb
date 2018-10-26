class Sale < ApplicationRecord

  # Associations
  belongs_to :income_type

  # Rails Money
  monetize :value_cents
end
