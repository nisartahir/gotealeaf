require 'pry'

class Card

	attr_accessor :suit, :value

	def initialize(n)

	end

	def card
		@suit
		@value
	end

end

class Deck #class name must be Capitalised

	attr_accessor :cards, :test

	def initialize(test)
		@cards = []
		@cards = ["HA", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "HJ", "HQ", "HK", "DA", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "DJ", "DQ", "DK", "SA", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "SJ", "SQ", "SK", "CA", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "CJ", "CQ", "CK"]
#    @cards = ["HA", "DA", "CA", "SA", "H3", "H4", "H6", "HJ", "HQ", "HK" ]
		
		shuffle_cards
	end

	def shuffle_cards

		cards.shuffle!
	end

	def deal

		cards.pop
	end

end

module Cards

  def total(cards)

    @eleven_found = 0
    total = 0
    cards.each do |x|
    
      card_value = x[1,2]      

      if card_value == "J" || card_value == "Q" || card_value == "K"
        card_value = "10"
      elsif card_value == "A"
        card_value = "11"
        @eleven_found = @eleven_found + 1
      end

      card_value = card_value.to_i
      total = total +  card_value

    end
    
    if total >= 22 && @eleven_found >= 1
      total = total - (10 * @eleven_found)
    end

    return total
  end

  def backjack?(cards)
    
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

end


class Player

include Cards

	attr_accessor :name, :eleven_found

	def initialize(name)

    @name = name

	end

end

class Dealer

include Cards

  attr_accessor :name

  def initialize(name)

    @name = name

  end
  
end

deck = Deck.new('deck')

cards = []
@player_total = 0

cards << deck.deal

Nisar = Player.new("Nisar")

while true

  system("clear")

  cards << deck.deal
  
  total = Nisar.total(cards)

  puts Nisar.name + " has been dealt " + cards.to_s
  puts Nisar.name + " has a total of " + total.to_s

  if Nisar.backjack?(cards) == true
    puts "You win #{Nisar.name}, you have BlackJack"
    exit
  elsif Nisar.bust?(total) == true
    puts "You lose #{Nisar.name}, you have busted"
    exit
  end

  puts "===>>>> Do you want another card or stay/stick #{Nisar.name}?"
  puts "<<<<=== Press Enter deal or s to stay/stick\n\n"

  user_response = gets.chomp

  if user_response =="s"
    @player_total = total
    break    
  end

end

 puts "You chose to stay/stick\n\n"

puts "========================YOUR TURN ENDED==========================="
cards = []
@dealer_total = 0
Ruby = Dealer.new("Dealer")

cards << deck.deal

while true
  

  cards << deck.deal

  total = Ruby.total(cards)

  puts Ruby.name + " has been dealt " + cards.to_s
  puts Ruby.name + " has a total of " + total.to_s

  if total >= 17
    @dealer_total = total
    break
  end
  
end

if Ruby.backjack?(cards) == true
  puts "You lose #{Nisar.name}, #{Ruby.name} has BlackJack"
  exit
elsif Ruby.bust?(total) == true
  puts "You win #{Nisar.name}, #{Ruby.name} has busted"
  exit
elsif @player_total > @dealer_total           
  puts "You won the game #{Nisar.name}"
elsif @dealer_total > @player_total
  puts "#{Ruby.name} won the game"
elsif @dealer_total == @player_total
  puts "The game was a tie"
end







