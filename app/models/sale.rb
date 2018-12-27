class Sale < ApplicationRecord

  # Associations
  belongs_to :master_sale, inverse_of: :sales
  belongs_to :income_type

  # Rails Money
  monetize :value_cents

  scope :from_type, -> (kind) {joins(:income_type).where(income_types: {name: kind})}

end
