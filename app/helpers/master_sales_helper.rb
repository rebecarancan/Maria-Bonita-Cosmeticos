module MasterSalesHelper

  def total_income(obj, type)
    obj.select { |sale| sale.income_type.name == type }.sum(&:value)
  end

  def total_days(obj, type)
    obj.select { |sale| sale.income_type.name == type }.count
  end

  def income_average(obj, kind)
    obj.from_type(kind).average(:value_cents)
  end

  def sale_color(sale)
    case sale
    when "Dinheiro"
      "class= income-color style=background:#d9b3ff"
    when "Crédito"
      "class= gen-color style=background:#ff7f7f"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

end
