module MasterOrdersHelper

  def orders_total(obj)
    obj.sum(&:value)
  end

  def order_color(order)
    if order.payment == "-"
      "class= income-color style=background:#d9b3ff"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

end
