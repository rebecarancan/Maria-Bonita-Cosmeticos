class Finance < ApplicationRecord

  # Associations
  belongs_to :expense_type
  belongs_to :income_type
  belongs_to :record_type

  # Validations
  validates :record_type, presence: true
  validates :day, presence: true
  validates :price_cents, presence: true

  # Rails Money
  monetize :value_cents

end
