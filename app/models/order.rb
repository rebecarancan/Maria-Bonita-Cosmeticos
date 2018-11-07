class Order < ApplicationRecord

  # Associations
  belongs_to :payment

  # Rails Money
  monetize :value_cents
end
