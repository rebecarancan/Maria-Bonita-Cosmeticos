class Note < ApplicationRecord

  # Associations
  belongs_to :master_note, inverse_of: :notes
  belongs_to :supplier

  # Rails Money
  monetize :value_cents
end
