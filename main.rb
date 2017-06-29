require 'sinatra'
require 'faker'

people = []

get '/' do
  @name = "Gustavo"
  erb :index
end

post '/people/?' do
  people.push(Faker::Name.name)
  puts people
end