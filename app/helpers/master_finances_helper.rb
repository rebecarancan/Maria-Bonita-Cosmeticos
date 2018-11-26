module MasterFinancesHelper

  def first_master_finance?(obj)
    if obj.id === MasterFinance.first.id
      return true
    end
  end
end
