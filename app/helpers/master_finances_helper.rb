module MasterFinancesHelper

  def calc_balance(balance)
    @master_finance.finances.each do |finance|
      if finance.expense_type.blank?
        balance += finance.value
      else
        balance -= finance.value
      end
    end
    return balance
  end

  def calc_income
    income = 0
    @master_finance.finances.each do |finance|
      if finance.expense_type.blank?
        income += finance.value
      end
    end
    return income
  end

    def calc_expense
    expense = 0
    @master_finance.finances.each do |finance|
      if finance.income_type.blank?
        expense += finance.value
      end
    end
    return expense
  end

end
