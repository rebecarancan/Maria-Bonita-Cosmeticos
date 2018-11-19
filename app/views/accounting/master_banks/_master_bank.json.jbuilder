json.extract! master_bank, :id, :year, :month, :balance_cents, :created_at, :updated_at
json.url master_bank_url(master_bank, format: :json)
