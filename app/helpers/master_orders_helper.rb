module MasterOrdersHelper

  def orders_total
    total = 0
    @master_order.orders.each do |order|
      total += order.value
    end
    return total
  end

end
