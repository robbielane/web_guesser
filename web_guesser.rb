require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

def guess_check(guess)
  if guess == 0
    "Guess a number (0 - 100)"
  else
    if guess > (SECRET_NUMBER + 5)
      ["Way too high!", "#BF3F46"]
    elsif guess < (SECRET_NUMBER - 5)
      ["Way too low!", "#BF3F46"]
    elsif guess > SECRET_NUMBER
      ["Too high!", "#FF5A64"]
    elsif guess < SECRET_NUMBER
      ["Too low!", "#FF5A64"]
    else
      ["You guessed it!", "#4ABF5A"]
    end
  end
end

def display_cheat?(cheat)
  if cheat.nil?
    "none"
  elsif cheat == "true"
    "block"
  else
    "none"
  end
end

get '/' do
  guess = params['guess'].to_i
  message, color = guess_check(guess)
  cheat = display_cheat?(params['cheat'])
  erb :index, :locals => {:secret_number => SECRET_NUMBER,
                          :message => message,
                          :color => color,
                          :cheat => cheat
                        }
end

#BF3F46 Dark red
#FF7A8A Light red
#4ABF5A Green
