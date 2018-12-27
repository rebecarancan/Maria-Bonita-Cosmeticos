module MasterBanksHelper
  def first_master_bank?(obj)
    if MasterBank.first == nil
      true
    else
      false
    end
  end
end
