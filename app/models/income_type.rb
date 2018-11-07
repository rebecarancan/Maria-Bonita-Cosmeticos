class IncomeType < ApplicationRecord

  # Associations
    has_many :finances
    has_many :banks
    has_many :sales
end
