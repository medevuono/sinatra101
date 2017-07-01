get '/api/quotes' do
  order = params[:order] ? params[:order] : "date"
  quotes = Quote.all(order)
  content_type 'application/json'
  quotes.to_json
end

post '/api/quotes' do
  body = JSON.parse( request.body.read.to_s, {symbolize_names: true} )
  quote = Quote.add(body)
  content_type 'application/json'
  quote.to_json
end

get '/api/quotes/:id' do
  quote = Quote.findById(params[:id].to_i)
  content_type 'application/json'
  response = {
    success: quote ? "true" : "false",
    data: quote ? quote : {},
  }
  response.to_json
end

put '/api/quotes/:id' do
  body = JSON.parse( request.body.read.to_s, {symbolize_names: true} )
  body[:id] = params[:id].to_i
  quote = Quote.update(body)
  content_type 'application/json'
  response = {
    success: quote ? "true" : "false",
    data: quote ? quote : {},
  }
  response.to_json
end

delete '/api/quotes/:id' do
  quote = Quote.delete(params[:id].to_i)
  content_type 'application/json'
  response = {
    success: quote ? "true" : "false",
    message: "The quote has been deleted",
  }
  response.to_json
end