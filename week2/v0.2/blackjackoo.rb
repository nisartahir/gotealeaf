require 'pry'

class Deck #class name must be Capitalised

	attr_accessor :cards, :test

	def initialize(test)
		@cards = []
		@cards = ["HA", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "HJ", "HQ", "HK", "DA", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "DJ", "DQ", "DK", "SA", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "SJ", "SQ", "SK", "CA", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "CJ", "CQ", "CK"]
    #@cards = ["HA", "DA", "CA", "SA", "H3", "H4", "H6", "HJ", "HQ", "HK" ]
		
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

  def card_grahics(cards)

    number_of_cards = cards.count
    array_number = 0

    top_line = ""
    first_line = ""
    second_line = ""
    third_line = ""
    fourth_line = ""
    fifth_line = ""
    sixth_line = ""
    bottom_line = ""

    card_suit = ""
    card_number = []

    cards.each do |x , y|
      
      card_suit << x[0,1]
      card_number<< x[1,2]

    end

    while number_of_cards > 0
      
      number_of_cards = number_of_cards - 1

      top_line << " _________ "
      first_line << "|         |"
      
      if card_number[array_number].to_s.length == 1
        second_line << "|       #{card_number[array_number]} |"
      else
        second_line << "|      #{card_number[array_number]} |"
      end
        
      third_line << "|         |"
      fourth_line <<  "|    #{card_suit[array_number]}    |"
      fifth_line << "|         |"
      
      if card_number[array_number].to_s.length == 1
        sixth_line << "| #{card_number[array_number]}       |"
      else
        sixth_line << "| #{card_number[array_number]}      |"
      end

      bottom_line << "|_________|"

      array_number = array_number + 1

    end

    print top_line
    puts "\n"
    print first_line
    puts "\n"
    print second_line
    puts "\n"
    print third_line
    puts "\n"
    print fourth_line
    puts "\n"
    print fifth_line
    puts "\n"
    print sixth_line
    puts "\n"
    print bottom_line

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

class Blackjack

  attr_accessor  :player, :dealer, :deck

  def initialize

    @player = Player.new("Nisar")
    @dealer = Dealer.new("Dealer")

  end

  def pause(duration)
  
    puts "please wait >>>>>>>>>\n"

    (1..duration).each do |pause|
      sleep 0.1
      print '#'

    end

    puts "\n"

  end

  def run

    loop do
      
      system("clear")

      username = ENV['USER'].to_s.capitalize

      puts "Would you like to play a game of Black Jack, #{username}?"
      puts "Press Enter to start or n and Enter to exit"
      user_response = gets.chomp

      if user_response == "n"

        loop exit

      end

      deck = Deck.new('deck')

      cards = []
      @player_total = 0

      cards << deck.deal

      until user_response == "s" do

        puts "==========================YOUR TURN=================================="
        puts "Dealing >>>>>>>>>"

        pause(10)

        cards << deck.deal
        
        total = @player.total(cards)

        @player.card_grahics(cards)
        
        puts "\n"
        puts @player.name + " has a total of " + total.to_s

        if @player.backjack?(cards) == true
          puts "You win #{@player.name}, you have BlackJack"
          break
        elsif @player.bust?(total) == true
          puts "You lose #{@player.name}, you have busted"
          break
        end

        puts "\n===>>>> Do you want another card or stay/stick #{@player.name}?"
        puts "<<<<=== Press Enter deal or s to stay/stick\n\n"

        user_response = gets.chomp

        if user_response =="s"
          @player_total = total


          puts "You chose to stay/stick\n\n"

          puts "========================YOUR TURN ENDED==========================="
          cards = []
          @dealer_total = 0

          cards << deck.deal

          while true
            
            puts "==========================DEALER TURN============================="
            pause(20)

            cards << deck.deal

            total = @dealer.total(cards)

            @dealer.card_grahics(cards)
            puts "\n"
            
            puts @dealer.name + " has a total of " + total.to_s

            if total >= 17
              @dealer_total = total
              break
            end
            
          end

          puts "=======================DEALER TURN ENDED===========================\n\n"
          puts "=========================GAME SUMMARY=============================="
          puts "Your cards total to #{@player_total} and Dealer cards total to #{@dealer_total}"
                

          if @dealer.backjack?(cards) == true
            puts "You lose #{@player.name}, #{@dealer.name} has BlackJack"
          elsif @dealer.bust?(total) == true
            puts "You win #{@player.name}, #{@dealer.name} has busted"
          elsif @player_total > @dealer_total           
            puts "You won the game #{@player.name}"
          elsif @dealer_total > @player_total
            puts "#{@dealer.name} won the game"
          elsif @dealer_total == @player_total
            puts "The game was a tie"
          end

          puts "=========================GAME SUMMARY==============================\n\n"
          
        end

      end

      puts "Press Enter to continue ..."
      user_response = gets.chomp


    end 
  end
end

game = Blackjack.new.run





