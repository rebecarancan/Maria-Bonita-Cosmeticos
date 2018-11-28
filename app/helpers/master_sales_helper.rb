module MasterSalesHelper

  def sales_total
    total = 0

    @master_sale.sales.each do |sale|
        total += sale.value
    end
    return total
  end

  def income_total(type)
    m_total = 0
    d_total = 0
    c_total = 0

    @master_sale.sales.each do |sale|
      if sale.income_type.name === "Dinheiro"
        m_total += sale.value
      elsif sale.income_type.name === "Débito"
        d_total += sale.value
      elsif sale.income_type.name === "Crédito"
        c_total += sale.value
      end
    end

    if type === 1
      return m_total
    elsif type === 2
      return d_total
    elsif type === 3
      return c_total
    end
  end

  def days_total(type)
    m_total = 0
    d_total = 0
    c_total = 0

    @master_sale.sales.each do |sale|
      if sale.income_type.name === "Dinheiro"
        m_total += 1
      elsif sale.income_type.name === "Débito"
        d_total += 1
      elsif sale.income_type.name === "Crédito"
        c_total += 1
      end
    end

    if type === 1
      return m_total
    elsif type === 2
      return d_total
    elsif type === 3
      return c_total
    end
  end

  def average(type)

    if type === 1 && days_total(1) != 0
      m_average = income_total(1) / days_total(1)
      return m_average
    elsif type === 2 && days_total(2) != 0
      d_average = income_total(2) / days_total(2)
      return d_average
    elsif type === 3 && days_total(3) != 0
      c_average = income_total(3) / days_total(3)
      return c_average
    end
  end

  def sale_color(i)
    if i.income_type.name == "Dinheiro"
      "class= income-color style=background:#d9b3ff"
    elsif i.income_type.name == "Crédito"
      "class= gen-color style=background:#ff7f7f"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

end
