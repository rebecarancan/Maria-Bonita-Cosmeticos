class MasterNote < ApplicationRecord

  # Validations
  validates :date, presence: true

  #Associations
  has_many :notes, -> { order('day DESC') }, inverse_of: :master_note, dependent: :destroy

  accepts_nested_attributes_for :notes, allow_destroy: true

end
