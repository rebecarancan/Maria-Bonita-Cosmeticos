class Bank < ApplicationRecord
  belongs_to :income_type
  belongs_to :record_type
end
