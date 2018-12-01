module ApplicationHelper

  MONTHS = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

  def options_for_month(selected)
    options_for_select(MONTHS, selected)
  end

  DISTRIBUTORS = ["Aladim", "Arcon", "Aspa", "Cristal", "GAO", "Glaucia","Marco Boni",
                  "Make One","Novo Toque", "Real", "Ricosti", "Rio Vermelho", "Wanderley"]

  def options_for_distributor(selected)
    options_for_select(DISTRIBUTORS, selected)
  end

  PAYMENTS = ["-", "Dinheiro", "Boleto/Dinheiro", "Boleto/Banco", "Cheque"]

  def options_for_payment(selected)
    options_for_select(PAYMENTS, selected)
  end

  def calc_balance(model, balance)
    model.each do |i|
      if i.expense_type.blank?
        balance += i.value
      else
        balance -= i.value
      end
    end

    balance
  end

  def calc_income(model)
    income = 0
    model.each do |i|
      if i.expense_type.blank?
        income += i.value
      end
    end
    return income
  end

    def calc_expense(model)
    expense = 0
    model.each do |i|
      if i.income_type.blank?
        expense += i.value
      end
    end
    return expense
  end

end
