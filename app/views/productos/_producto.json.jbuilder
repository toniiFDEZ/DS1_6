json.extract! producto, :id, :nombre, :precio, :cantidad, :created_at, :updated_at
json.url producto_url(producto, format: :json)
