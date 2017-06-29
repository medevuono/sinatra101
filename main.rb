require 'sinatra'

# Load configuration file
require './config/application'

# Load Routes
require './config/routes'

# Quotes route
require './app/controllers/quotes_controller'