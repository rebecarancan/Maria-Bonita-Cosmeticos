class RecordType < ApplicationRecord

  # Associations
    has_many :finances
    has_many :banks

end
