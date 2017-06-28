require 'sinatra'

get '/' do
  @name = "Gustavo"
  erb :index
end

get '/profile' do
  @name = "Gustavo"
  erb :profile
end