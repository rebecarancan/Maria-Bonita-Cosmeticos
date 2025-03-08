class Order < ApplicationRecord
  PAYMENTS = ["-", "Dinheiro", "Boleto/Dinheiro", "Boleto/Banco", "Cheque"]

  # Associations
  belongs_to :master_order, inverse_of: :orders
  belongs_to :supplier

  # Rails Money
  monetize :value_cents

  def payment
    super || PAYMENTS.first
  end
end
