class Supplier < ApplicationRecord

  # Validations
  validates :name, presence: true

  # Associations
    has_many :orders
    has_many :notes

end
