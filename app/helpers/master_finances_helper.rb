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

end
