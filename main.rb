require 'sinatra'

# Load configuration file
require './config/application'

# Load Routes
require './config/routes'

# Quotes
require './app/models/quote'
require './app/controllers/quotes_controller'

# API Quotes
require './api/controllers/quotes_controller'