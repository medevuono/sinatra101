require 'sinatra'
require 'faker'

# Load confguration file
require './config/development'

# Root route
get '/' do
  @name = "Gustavo"
  erb :index
end

# Profile route
require './app/controllers/profile'