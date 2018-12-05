class MasterBank < ApplicationRecord

  #Associations
  has_many :banks, -> { order('day DESC') }, dependent: :destroy

  accepts_nested_attributes_for :banks, allow_destroy: true

  # Rails Money
  monetize :balance_cents

end
