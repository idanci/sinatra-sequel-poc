require 'sinatra'

get '/' do
  content_type :json

  order_column = User.columns.detect { |column| column == params[:sort]&.to_sym } || :first_name

  DB[:users].order(Sequel.desc(order_column)).all.to_json
end

post '/' do
  content_type :json

  request.body.rewind

  data = JSON.parse request.body.read
  user_attributes = data.dig('data', 'attributes') || {}

  user = User.new(user_attributes)

  if user.valid?
    status 201
    user.save.to_json
  else
    status 406
    user.errors.to_json
  end
end
