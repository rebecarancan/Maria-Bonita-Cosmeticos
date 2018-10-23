json.extract! record_type, :id, :name, :created_at, :updated_at
json.url record_type_url(record_type, format: :json)
