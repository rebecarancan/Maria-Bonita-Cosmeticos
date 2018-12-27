class MasterSale < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :sales, -> { order('day DESC') }, inverse_of: :master_sale, dependent: :destroy

  accepts_nested_attributes_for :sales, allow_destroy: true

end
