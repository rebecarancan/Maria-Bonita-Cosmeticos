json.extract! order, :id, :day, :distributor, :value, :payment_id, :created_at, :updated_at
json.url order_url(order, format: :json)
