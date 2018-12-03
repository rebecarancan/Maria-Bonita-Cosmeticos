module ApplicationHelper

  MONTHS = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

  def options_for_month(selected)
    options_for_select(MONTHS, selected)
  end

  DISTRIBUTORS = ["-", "Aladim", "Arcon", "Aspa", "Cristal", "GAO", "Glaucia","Marco Boni",
                  "Make One","Novo Toque", "Real", "Ricosti", "Rio Vermelho", "Wanderley"]

  def options_for_distributor(selected)
    options_for_select(DISTRIBUTORS, selected)
  end

  PAYMENTS = ["-", "Dinheiro", "Boleto/Dinheiro", "Boleto/Banco", "Cheque"]

  def options_for_payment(selected)
    options_for_select(PAYMENTS, selected)
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

end
