module MasterFinancesHelper
  def first_master_finance?(obj)
    obj.id == MasterFinance.first.id
  end
end
