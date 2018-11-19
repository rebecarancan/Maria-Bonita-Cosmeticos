class Order < ApplicationRecord

 # Associations
  belongs_to :master_order

  # Rails Money
  monetize :value_cents
end
