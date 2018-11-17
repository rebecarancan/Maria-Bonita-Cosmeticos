json.extract! master_sale, :id, :year, :month, :balance_cents, :created_at, :updated_at
json.url master_sale_url(master_sale, format: :json)
