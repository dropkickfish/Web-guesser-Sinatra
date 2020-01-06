# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?

set :number, rand(100).to_i
$guesses = 11


get '/' do

  guess = params["guess"]
  message = check_guess(guess)
  $guesses -= 1
  erb :index, :locals => {:number => @@number, :message => message, :guesses => $guesses, :colour => @@colour }
end

def reset 
  
  settings.number = rand(100).to_i
  $guesses = 11
end

def check_guess(guess)
  
  if $guesses < 2
    reset
    colour = "maroon"
    "Game over, resetting number. Guess the new number"
    
   
  else

    if guess.nil?
      message = ""

    elsif guess.to_i == settings.number
      reset
      @@colour = "green"
      message = "You won, resetting game. Guess the new number"
      

    elsif guess.to_i > settings.number
      if guess.to_i > settings.number + 5
        @@colour = "red"
        message = "Too damn high"
        
      else
        @@colour = "pink"
        message = "Too high"
        
      end

    elsif guess.to_i < settings.number
      if guess.to_i < settings.number - 5
        @@colour = "red"
        message = "Too damn low"
        
      else
        @@colour = "pink"
        message = "Too low"
         
      end
    end
  end
end