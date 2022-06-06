json.extract! inicio_sesion, :id, :usuario, :password, :created_at, :updated_at
json.url inicio_sesion_url(inicio_sesion, format: :json)
