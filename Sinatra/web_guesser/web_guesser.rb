# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

secret = rand(100)

get '/' do
  "The SECRET NUMBER is #{secret}"
end