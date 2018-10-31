module ProductsHelper

  def calculate_price(cost, margin)
    cost + ( cost * margin * 0.01)
  end
end
