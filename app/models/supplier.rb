class Supplier < ApplicationRecord

  # Associations
    has_many :orders
    has_many :notes

end
