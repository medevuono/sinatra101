get '/quotes' do
  if params[:order]
    session[:order] = params[:order]
  elsif !session[:order]
    session[:order] = "date"
  end
  
  @quotes = Quote.all(session[:order])
  @order = session[:order]
  erb :'quotes/index'
end

get '/quotes/new' do
  erb :'quotes/new'
end

post '/quotes' do
  Quote.add({ description: params[:description], author: params[:author] })
  redirect '/quotes'
end

get '/quotes/:id' do
  @q = Quote.findById(params[:id].to_i)
  erb :'quotes/show'
end

get '/quotes/:id/edit' do
  @q = Quote.findById(params[:id].to_i)
  erb :'quotes/edit'
end

post '/quotes/:id/update' do
  Quote.update({
    id: params[:id].to_i, 
    description: params[:description], 
    author: params[:author] 
  })
  redirect '/quotes'
end

get '/quotes/:id/delete' do
  Quote.delete(params[:id].to_i)
  redirect '/quotes'
end