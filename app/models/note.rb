class Note < ApplicationRecord

  # Associations
  belongs_to :master_note
  belongs_to :supplier

  # Rails Money
  monetize :value_cents
end
