class Note < ApplicationRecord
  # Rails Money
  monetize :value_cents
end
