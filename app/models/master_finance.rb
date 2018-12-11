class MasterFinance < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :finances, -> { order('day DESC') }, dependent: :destroy

  accepts_nested_attributes_for :finances, allow_destroy: true

  # Rails Money
  monetize :initial_balance_cents
  monetize :final_balance_cents, allow_nil: true

end
