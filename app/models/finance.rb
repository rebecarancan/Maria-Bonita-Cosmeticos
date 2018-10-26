class Finance < ApplicationRecord

  # Associations
  belongs_to :expense_type
  belongs_to :record_type

  # Rails Money
  monetize :value_cents
end
