class MasterNote < ApplicationRecord

  #Associations
  has_many :notes, -> { order('day DESC') }, dependent: :destroy

  accepts_nested_attributes_for :notes, allow_destroy: true

end
