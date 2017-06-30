get '/quotes' do
  @quotes = @@quotes
  erb :'quotes/index'
end

get '/quotes/new' do
  erb :'quotes/new'
end

post '/quotes' do
  @@quotes.push({ description: params[:description], author: params[:author] })
  redirect '/quotes'
end