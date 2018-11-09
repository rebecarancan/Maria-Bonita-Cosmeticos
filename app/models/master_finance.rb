class MasterFinance < ApplicationRecord

  #Associations
  has_many :finances, inverse_of: :master_finance

  accepts_nested_attributes_for :finances, allow_destroy: true

end
