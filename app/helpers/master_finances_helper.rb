module MasterFinancesHelper
  def first_master_finance?
    if MasterFinance.first == nil
      true
    else
      false
    end
  end
end
