class Bank < ApplicationRecord
  # Associations
  belongs_to :income_type
  belongs_to :record_type

  # Rails Money
  monetize :value_cents
end
