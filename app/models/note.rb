class Note < ApplicationRecord

  # Associations
  belongs_to :master_note

  # Rails Money
  monetize :value_cents
end
