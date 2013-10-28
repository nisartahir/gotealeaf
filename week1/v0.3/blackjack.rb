require 'pry'

def deal_card

  card_deck = { 'DA' => 1, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'D9' => 9, 'D10' => 10, 'DJ' => 10, 'DQ' => 10, 'DK' => 10, 'HA' => 1, 'H2' => 2, 'H3' => 3, 'H4' => 4 , 'H5' => 5 , 'H6' => 6 , 'H7' => 7 , 'H8' => 8, 'H9' => 9, 'H10' => 10, 'HJ' => 10, 'HQ' => 10, 'HK' => 10,  'CA' => 1, 'C2' => 2, 'C3' => 3, 'C4' => 4 , 'C5' => 5 , 'C6' => 6 , 'C7' => 7 , 'C8' => 8, 'C9' => 9, 'C10' => 10, 'CJ' => 10, 'CQ' => 10, 'CK' => 10,  'SA' => 1, 'S2' => 2, 'S3' => 3, 'S4' => 4 , 'S5' => 5 , 'S6' => 6 , 'S7' => 7 , 'S8' => 8, 'S9' => 9, 'S10' => 10, 'SJ' => 10, 'SQ' => 10, 'SK' => 10 }

  #pull out a random card from all the cards from the deck  
  #card = card_deck.keys.sample(1)
  @card = card_deck.keys.sample(1)

  #card[0] contains the key from the hash, eg DK, select the value based on the randomly chosen key
  @player_card_number = card_deck[@card[0]]

end

#Show 
def players_hand(players_cards)

  @player_card_number_total = 0
  @current_player_cards = ""
   
  players_cards.each do |x , y| 
    #Find the current card total
    @player_card_number_total  =+ @player_card_number_total + y
    #Build a string of the current players position
    @current_player_cards = @current_player_cards  + " " + y.to_s + " of " +  suit(x[0,1])
  end 

end

def suit(card_suit)

	if card_suit == 'D'
		suit = "Diamonds"
	elsif card_suit == 'H'
		suit = "Hearts"
	elsif card_suit == 'C'
		suit = "Clubs"
	elsif card_suit == 'S'
		suit = "Spades"
	end

	return suit
end

puts "Welcome to Black Jack"
puts "Please enter your name"

#player1 = gets.chomp
#puts "Hello #{player1}"
players_cards = {}

deal_card
card = @card.to_s.tr '"[]',''
players_cards = {card => @player_card_number}

deal_card
card = @card.to_s.tr '"[]',''
players_cards.merge! card => @player_card_number

p ''
p ''

players_hand(players_cards)

p "You have:"
p "#{@current_player_cards}"

p "Your total is #{@player_card_number_total}"

#check the card values
#remove the cards from the deck
#reload the deck when finished
#allow the player to hit or stick


#binding.pry	
