class MasterSale < ApplicationRecord

  #Associations
  has_many :sales, dependent: :destroy

  accepts_nested_attributes_for :sales, allow_destroy: true

  # Rails Money
  monetize :balance_cents

end
