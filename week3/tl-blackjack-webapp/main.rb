require 'rubygems'
require 'sinatra'

set :sessions, true

get '/' do
  redirect '/login'
end

get '/login' do
  erb :login_form
end

post '/startgame' do
  erb :game
end

