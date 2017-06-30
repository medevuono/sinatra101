get '/quotes' do
  @quotes = @@quotes
  erb :'quotes/index'
end

get '/quotes/new' do
  erb :'quotes/new'
end

post '/quotes' do
  @@quotes.unshift({ description: params[:description], author: params[:author] })
  redirect '/quotes'
end

get '/quotes/:id' do
  @index = params[:id].to_i
  @q = @@quotes[@index]
  erb :'quotes/show'
end

get '/quotes/:id/edit' do
  @index = params[:id].to_i
  @q = @@quotes[@index]
  erb :'quotes/edit'
end

post '/quotes/:id/update' do
  @index = params[:id].to_i
  @@quotes[@index] = { description: params[:description], author: params[:author] }
  redirect '/quotes'
end

get '/quotes/:id/delete' do
  @index = params[:id].to_i
  @@quotes.delete_at(@index)
  redirect '/quotes'
end