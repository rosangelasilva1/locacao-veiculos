json.extract! usuario, :id, :nome, :cpf, :endereco, :numero, :bairro, :cep, :estado, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
