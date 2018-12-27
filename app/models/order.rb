class Order < ApplicationRecord

  # Associations
  belongs_to :master_order, inverse_of: :orders
  belongs_to :supplier

  # Rails Money
  monetize :value_cents
end
