get '/quotes' do
  if params[:order]
    session[:order] = params[:order]
  elsif !session[:order]
    session[:order] = "date"
  end

  @quotes = Quote.all(session[:order])
  @order = session[:order]
  @flash = session[:flash]
  session[:flash] = nil
  erb :'quotes/index'
end

get '/quotes/new' do
  erb :'quotes/new'
end

post '/quotes' do
  Quote.add({ description: params[:description], author: params[:author] })
  session[:flash] = {
    message: "The quote has been added",
    type: "success"
  }
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
  session[:flash] = {
    message: "The quote has been edited",
    type: "warning"
  }
  redirect '/quotes'
end

get '/quotes/:id/delete' do
  Quote.delete(params[:id].to_i)
  session[:flash] = {
    message: "The quote has been deleted",
    type: "danger"
  }
  redirect '/quotes'
end