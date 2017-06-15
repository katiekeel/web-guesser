require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = rand(1..50)
  "The secret number is #{number}"
end
