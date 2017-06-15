require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

SECRET_NUMBER = rand(100)

@correct = false

@way_too = false

@wrong = false

def check_guess(guess)
  if guess == SECRET_NUMBER
    @correct = true
    message = "You got it right!"
  elsif guess > SECRET_NUMBER + 5
    @way_too = true
    message = "Way too high!"
  elsif guess < SECRET_NUMBER - 5
    @way_too = true
    message = "Way too low!"
  elsif guess > SECRET_NUMBER
    @wrong = true
    message = "Too high!"
  elsif guess < SECRET_NUMBER
    @wrong = true
    message = "Too low!"
  end
end
