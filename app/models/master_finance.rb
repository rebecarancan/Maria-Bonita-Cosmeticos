class MasterFinance < ApplicationRecord

  #Associations
  has_many :finances, -> { order('day DESC') }, dependent: :destroy

  accepts_nested_attributes_for :finances, allow_destroy: true

  # Rails Money
  monetize :balance_cents

end
