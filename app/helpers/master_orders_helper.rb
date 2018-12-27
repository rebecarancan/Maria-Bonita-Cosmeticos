module MasterOrdersHelper

  def order_color(order)
    case order
    when "-"
      "class= income-color style=background:#d9b3ff"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

end
