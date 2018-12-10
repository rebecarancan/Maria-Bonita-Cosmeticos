module MasterBanksHelper
  def first_master_bank?(obj)
    obj.id == MasterBank.first.id
  end
end
