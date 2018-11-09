class Finance < ApplicationRecord

  # Associations
  belongs_to :master_finance
  belongs_to :record_type
  belongs_to :expense_type, optional: true
  belongs_to :income_type, optional: true

  # Validations
  validates :record_type, presence: true
  validates :day, presence: true
  validates :value_cents, presence: true

  # Rails Money
  monetize :value_cents

end
