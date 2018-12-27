class MasterBank < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :banks, -> { order('day DESC') }, inverse_of: :master_bank, dependent: :destroy

  accepts_nested_attributes_for :banks, allow_destroy: true

  # Rails Money
  monetize :initial_balance_cents
  monetize :final_balance_cents, allow_nil: true

end
