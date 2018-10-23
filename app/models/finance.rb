class Finance < ApplicationRecord
  belongs_to :expense_type
  belongs_to :record_type
end
