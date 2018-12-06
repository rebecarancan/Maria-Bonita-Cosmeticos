class Order < ApplicationRecord

  # Associations
  belongs_to :master_order
  belongs_to :supplier

  # Rails Money
  monetize :value_cents
end
