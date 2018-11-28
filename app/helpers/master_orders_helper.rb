module MasterOrdersHelper

  def orders_total
    total = 0
    @master_order.orders.each do |order|
      total += order.value
    end
    return total
  end

  def order_color(i)
    if i.payment == "-"
      "class= income-color style=background:#d9b3ff"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

end
