require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def guess_check(guess)
  if guess == 0
    "Make a guess (0 - 100)"
  else
    if guess > (SECRET_NUMBER + 5)
      "Way too high!"
    elsif guess < (SECRET_NUMBER - 5)
      "Way too low!"
    elsif guess > SECRET_NUMBER
      "Too high!"
    elsif guess < SECRET_NUMBER
      "Too low!"
    else
      "You guessed it!"
    end
  end
end

get '/' do
  guess = params['guess'].to_i
  message = guess_check(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message}

end
