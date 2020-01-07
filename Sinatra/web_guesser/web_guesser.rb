# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?

set :number, rand(100).to_i
@@guesses = 6
@@colour = "white"

get '/' do
  cheat = params["cheat"]
  guess = params["guess"]
  message = check_guess(guess)
  cheatmessage = cheatmode(cheat)
  @@guesses -= 1
  erb :index, :locals => { :message => message, :cheatmessage => cheatmessage, :guesses => @@guesses, :colour => @@colour }
end

def reset 
  
  settings.number = rand(100).to_i
  @@guesses = 6
end

def cheatmode(cheat)
  if cheat == "true"
    "The number is #{settings.number}"
  else
    ""
  end
end

def check_guess(guess)
  
  if @@guesses < 2
    reset
    @@colour = "maroon"
    "Game over, resetting number. Guess the new number"
    
   
  else

    if guess.nil?
      ""
      
    elsif guess.to_i == settings.number
      reset
      @@colour = "green"
      "You won, resetting game. Guess the new number"
      

    elsif guess.to_i > settings.number
      if guess.to_i > settings.number + 5
        @@colour = "red"
        "Too damn high"
        
      else
        @@colour = "pink"
        "Too high"
        
      end

    elsif guess.to_i < settings.number
      if guess.to_i < settings.number - 5
        @@colour = "red"
        "Too damn low"
        
      else
        @@colour = "pink"
        "Too low"
         
      end
    end
  end
end