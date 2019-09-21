require 'sinatra'

get '/' do
  content_type :json

  order_column = User.columns.detect { |column| column == params[:sort]&.to_sym } || :first_name

  DB[:users].order(Sequel.desc(order_column)).all.to_json
end
