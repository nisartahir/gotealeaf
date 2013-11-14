require 'rubygems'
require 'sinatra'

set :sessions, true

helpers do
  def deal
    #"<deal>#{text}</deal>"
    session[:player_cards] << session[:card_deck].pop
  end

  def card_deck
    deck =[]
    deck = ["HA", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "HJ", "HQ", "HK", "DA", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "DJ", "DQ", "DK", "SA", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "SJ", "SQ", "SK", "CA", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "CJ", "CQ", "CK"]
    session[:card_deck] = deck.shuffle!
  end

end

get '/' do
  redirect '/login'
end

get '/login' do
  session[:player_cards] = []
  card_deck
  erb :login_form
end

post '/game' do
   if session[:player_cards].empty?
    deal
    deal
  end
  erb :game
end
  
get '/game' do
  session[:username] = params[:username]
  if session[:player_cards].empty?
    deal
    deal
  end
  erb :game
end

post '/hit' do
	erb :hit
  redirect '/game'
end

post '/stay' do
	erb :stay
end

