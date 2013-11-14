require 'rubygems'
require 'sinatra'

set :sessions, true

helpers do
  def deal(who_is_playing)
    if who_is_playing == "Player"
      session[:player_cards] << session[:card_deck].pop
    elsif who_is_playing == "Dealer"
      session[:dealer_cards] << session[:card_deck].pop
    end
  end

  def card_deck
    deck =[]
    deck = ["HA", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "HJ", "HQ", "HK", "DA", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "DJ", "DQ", "DK", "SA", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "SJ", "SQ", "SK", "CA", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "CJ", "CQ", "CK"]
    session[:card_deck] = deck.shuffle!
  end

  def total(cards)

      eleven_found = 0
      total = 0
      cards.each do |x|
      
        card_value = x[1,2]      

        if card_value == "J" || card_value == "Q" || card_value == "K"
          card_value = "10"
        elsif card_value == "A"
          card_value = "11"
          eleven_found = eleven_found + 1
        end

        card_value = card_value.to_i
        total = total +  card_value

      end
      
      if total >= 22 && eleven_found >= 1
        total = total - (10 * eleven_found)
      end

      return total
    end

    def blackjack?(cards)
      
      if cards.count == 2 
      
        if total(cards) == 21
          true
        end

      end
      
    end

    def bust?(total)
      
        if total > 21
          true
        end
      
    end

    def get_filenames_of_cards(cards)
      cards_with_names =[]
      cards.each do |x|
        card_suit = x[0,1]
        card_value = x[1,2]
        if card_value.to_i
          cards_with_names << "/images/cards/#{card_suit_name(card_suit)}_#{card_value_name(card_value)}.jpg"  
        else    
          cards_with_names << "/images/cards/#{card_suit_name(card_suit)}_#{card_value}.jpg"
        end
      end
      return cards_with_names
    end

    def card_suit_name(suit)
      case suit
      when "D"
        suit = "diamonds"
      when "H"
        suit = "hearts"
      when "C"
        suit = "clubs"
      when "S"
        suit = "spades"
      end
      return suit
    end

    def card_value_name(card)
      case card
      when "A"
        card = "ace"
      when "K"
        card = "king"
      when "Q"
        card = "queen"
      when "J"
        card = "jack"        
      end
      return card  
    end
end

get '/' do
  redirect '/login'
end

get '/login' do
  session[:player_stayed] = false
  session[:player_cards] = []
  session[:dealer_cards] = []
  card_deck
  erb :login_form
end

post '/game' do
  session[:username] = params[:username]
  if session[:player_cards].empty?
    deal("Player")
    deal("Player")
    session[:total] = total(session[:player_cards])
  end
  erb :game
end
  
get '/game' do
  erb :game
end

post '/hit' do
	erb :hit
  redirect '/game'
end

post '/stay' do
	erb :stay
  redirect '/game'
end

