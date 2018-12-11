class MasterSale < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :sales, -> { order('day DESC') }, dependent: :destroy

  accepts_nested_attributes_for :sales, allow_destroy: true

end
