class Product < ApplicationRecord

  # Rails Money
  monetize :cost_cents

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("code LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
  end

end
