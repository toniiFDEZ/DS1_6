json.extract! usuario, :id, :name, :password, :email, :direccion, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
