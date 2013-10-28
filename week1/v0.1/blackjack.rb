require 'pry'

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


puts "Welcome to Jackjack"
puts "Please enter your name"

#player1 = gets.chomp

#puts "Hello #{player1}"

card_deck = { 'DA' => 1, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'D9' => 9, 'D10' => 10, 'DJ' => 10, 'DQ' => 10, 'DK' => 10, 'HA' => 1, 'H2' => 2, 'H3' => 3, 'H4' => 4 , 'H5' => 5 , 'H6' => 6 , 'H7' => 7 , 'H8' => 8, 'H9' => 9, 'H10' => 10, 'HJ' => 10, 'HQ' => 10, 'HK' => 10,  'CA' => 1, 'C2' => 2, 'C3' => 3, 'C4' => 4 , 'C5' => 5 , 'C6' => 6 , 'C7' => 7 , 'C8' => 8, 'C9' => 9, 'C10' => 10, 'CJ' => 10, 'CQ' => 10, 'CK' => 10,  'SA' => 1, 'S2' => 2, 'S3' => 3, 'S4' => 4 , 'S5' => 5 , 'S6' => 6 , 'S7' => 7 , 'S8' => 8, 'S9' => 9, 'S10' => 10, 'SJ' => 10, 'SQ' => 10, 'SK' => 10 }

cards = card_deck.keys # pull out all the cards from the deck

p cards
p player_cards = cards.sample(2) # Select two random cards from the cards array 

p player_cards[0] #player card 1 
p player_cards[1] # player card 2

p card_deck[player_cards[0]] #player card 1 
p card_deck[player_cards[1]] #player card 2

card1 = player_cards[0]

p card1[0,1] # Find the suit of the card. e.g. Diamonds
p card_deck[player_cards[0]] # card value. e.g. King

card2 = player_cards[1]

p card2[0,1] # Find the suit of the card. e.g. Diamonds
p card_deck[player_cards[1]] # card value. e.g. King

p suit(card1[0,1])
p suit(card2[0,1])

p "You have:"
p card1[1,1] + " of " + suit(card1[0,1]) + " and"
p card2[1,1] + " of " + suit(card2[0,1])

p "Your total is #{card_deck[player_cards[0]] + card_deck[player_cards[1]]}"

#check the card values
#remove the cards from the deck
#reload the deck when finished
#allow the player to hit or stick


#binding.pry	
