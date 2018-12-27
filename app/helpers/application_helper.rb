module ApplicationHelper

  PAYMENTS = ["-", "Dinheiro", "Boleto/Dinheiro", "Boleto/Banco", "Cheque"]

  def options_for_payment(selected)
    options_for_select(PAYMENTS, selected)
  end

  def value_total(obj)
    obj.sum(&:value)
  end

  def calc_balance(obj, balance)
    obj.each do |i|
      if i.expense_type.blank?
        balance += i.value
      else
        balance -= i.value
      end
    end
    balance
  end

  def income_calc(obj)
    obj.select { |sale| sale.expense_type.blank? }.sum(&:value)
  end

  def expense_calc(obj)
    obj.select { |sale| sale.income_type.blank? }.sum(&:value)
  end

  def change_color(i)
    if i.expense_type.blank?
      "class= income-color style=background:#d9b3ff"
    else
      "class= expense-color style=background:#ffaaaa"
    end
  end

  def inc_show(i)
    unless i.income_type.blank?
      i.income_type.name
    end
  end

  def exp_show(i)
    unless i.expense_type.blank?
      i.expense_type.name
    end
  end

  def chart(type)
    master_sales = MasterSale.group_by_year(:date, format: '%Y').group_by_month_of_year(:date, format: '%B').joins(sales: :income_type).where(sales: { income_types: { name: type}}).sum(:value_cents)

    master_sales.each do |key, value|
      master_sales[key] = Money.new(value, 'BRL').to_f
    end

    @income = master_sales
  end

  def chart_total
    master_sales = MasterSale.group_by_year(:date, format: '%Y').group_by_month_of_year(:date, format: '%B').joins(:sales).sum(:value_cents)

    master_sales.each do |key, value|
      master_sales[key] = Money.new(value, 'BRL').to_f
    end

    @income = master_sales
  end

end
