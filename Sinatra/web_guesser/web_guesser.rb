require 'sinatra'
#require 'sinatra/reloader'

get '/' do
  "Hello, World!/n"
  "The secret number is #{rand(100)}"
end