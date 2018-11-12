class Finance < ApplicationRecord

  # Associations
  belongs_to :master_finance
  belongs_to :expense_type, optional: true
  belongs_to :income_type, optional: true


  # Rails Money
  monetize :value_cents

end
