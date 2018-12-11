class MasterOrder < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :orders, -> { order('purchase DESC') }, dependent: :destroy

  accepts_nested_attributes_for :orders, allow_destroy: true

end
