require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

SECRET_NUMBER = rand(100)

@correct = false

def check_guess(guess)
  if guess == SECRET_NUMBER
    @correct = true
    message = "You got it right!"
  elsif guess > SECRET_NUMBER + 5
    message = "Way too high!"
  elsif guess < SECRET_NUMBER - 5
    message = "Way too low!"
  elsif guess > SECRET_NUMBER
    message = "Too high!"
  elsif guess < SECRET_NUMBER
    message = "Too low!"
  end
end
