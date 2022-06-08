json.extract! usuario, :id, :name, :nick, :password, :email, :direccion, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
