get '/profile/(:team(/)?)?' do
  if params[:team]
    @name = params[:name]
    @lastname = params[:lastname]
    @team = params[:team] 

    erb :profile
  else
    status 500
    "No team param provided"
  end
end