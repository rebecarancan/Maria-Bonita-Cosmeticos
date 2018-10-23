json.extract! product, :id, :code, :name, :cost, :price, :margin, :created_at, :updated_at
json.url product_url(product, format: :json)
