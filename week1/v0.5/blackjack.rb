require 'pry'

def deal_card

card_deck = { 'DA' => 11, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'D9' => 9, 'D10' => 10, 'DJ' => 10, 'DQ' => 10, 'DK' => 10, 'HA' => 11, 'H2' => 2, 'H3' => 3, 'H4' => 4 , 'H5' => 5 , 'H6' => 6 , 'H7' => 7 , 'H8' => 8, 'H9' => 9, 'H10' => 10, 'HJ' => 10, 'HQ' => 10, 'HK' => 10,  'CA' => 11, 'C2' => 2, 'C3' => 3, 'C4' => 4 , 'C5' => 5 , 'C6' => 6 , 'C7' => 7 , 'C8' => 8, 'C9' => 9, 'C10' => 10, 'CJ' => 10, 'CQ' => 10, 'CK' => 10,  'SA' => 11, 'S2' => 2, 'S3' => 3, 'S4' => 4 , 'S5' => 5 , 'S6' => 6 , 'S7' => 7 , 'S8' => 8, 'S9' => 9, 'S10' => 10, 'SJ' => 10, 'SQ' => 10, 'SK' => 10 }
#card_deck = { 'DA' => 11, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'HA' => 11 , 'CA' => 11 , 'SA' => 11, }

  #pull out a random card from all the cards from the deck  

  @card = card_deck.keys.sample(1)
  #p "&&&&&&&&&&&&&&&&&&&&&DEBUG INFO: (Card being dealt) #{@card}&&&&&&&&&&&&&&&&&&&&&"
  #card[0] contains the key from the hash, eg DK, select the value based on the randomly chosen key
  @player_card_number = card_deck[@card[0]]
  @dealer_card_number = card_deck[@card[0]]

end

def card_grahic(card_value, card_suit)
  
  if card_value.to_s.length == 1
  
    return " _________\n|         |\n|       #{card_value} |\n|         |\n|    #{card_suit}    |     [#{JQKA(card_value)}] #{suit(card_suit)}\n|         |\n| #{card_value}       |\n|_________|\n"
 
   else

    return " _________\n|         |\n|      #{card_value} |\n|         |\n|    #{card_suit}    |    [#{JQKA(card_value)}] #{suit(card_suit)}\n|         |\n| #{card_value}      |\n|_________|\n"

  end

end

def players_hand(players_cards)

  @eleven_found = 0
  @player_card_number_total = 0
  @current_player_cards = ""
   
  players_cards.each do |x , y|
    
    if y == 11
      #count the number of Aces we find, starting with zero
      @eleven_found = @eleven_found + 1
    
    end 

    @player_card_number_total  =+ @player_card_number_total + y


    #Build a string of the current players position
    
    @current_player_cards = @current_player_cards  + card_grahic(x[1,2], x[0,1]) # [" + y.to_s + " of " +  suit(x[0,1]) + "]"

  end 

end

def dealers_hand(dealers_cards)

  @eleven_found = 0
  @dealer_card_number_total = 0
  @current_dealer_cards = ""
   
  dealers_cards.each do |x , y|
    
    if y == 11
      #count the number of Aces we find, starting with zero
      @eleven_found = @eleven_found + 1
    
    end
    
    @dealer_card_number_total  =+ @dealer_card_number_total + y

    #Build a string of the current players position
    @current_dealer_cards = @current_dealer_cards  + card_grahic(x[1,2], x[0,1]) #" [" + y.to_s + " of " +  suit(x[0,1]) + "]"

  end 

end


def suit(card_suit)

	if card_suit == 'D'
		suit = "of Diamonds"
	elsif card_suit == 'H'
		suit = "of Hearts"
	elsif card_suit == 'C'
		suit = " of Clubs"
	elsif card_suit == 'S'
		suit = "of Spades"
	end

	return suit

end

def JQKA(card)
  
  if card == "J"

    return "Jack"

  elsif card == "Q"

    return "Queen" 

  elsif card == "K"

    return "King" 
  
  elsif card == "A"

    return "Ace"

  else

    return card
  
  end  
    
end

def show_cards(current_cards, card_number_total)

    puts "#{current_cards}\n\n"

    puts "Cards total to #{card_number_total}\n"

    puts card_grahic(card_number_total,"T")
    
end


loop do

system("clear")

username = ENV['USER'].to_s.capitalize

puts "Would you like to play a game of Black Jack, #{username}?"
puts "Press Enter to start or n and Enter to exit"
user_response = gets.chomp

if user_response == "n"

  loop exit

end

@card = nil
@player_card_number = nil
@dealer_card_number = nil
@eleven_found = 0
@player_card_number_total = 0
@dealer_card_number_total = 0
@current_player_cards = ""
players_cards = nil

puts "Welcome to Black Jack #{username}"

players_cards = {}

deal_card
card = @card.to_s.tr '"[]',''
players_cards = {card => @player_card_number}

catch(:stop) do
  while true

    puts "==========================YOUR TURN=================================="
    puts "Dealing >>>>>>>>>"

    sleep 1

    deal_card
    card = @card.to_s.tr '"[]',''
    players_cards.merge! card => @player_card_number

    #p "&&&&DEBUG INFO: (Cards that HAVE being dealt) #{players_cards}&&&&&"
    #players_cards

    players_hand(players_cards)

    if @player_card_number_total >= 22 && @eleven_found >= 1

     @player_card_number_total = @player_card_number_total - (10 * @eleven_found)
     
    end
    
    show_cards(@current_player_cards, @player_card_number_total)


    if @player_card_number_total >= 22
      
      puts "=========================GAME SUMMARY=============================="
      puts "Unfortunately, you busted the game #{username}"
      puts "=========================GAME SUMMARY==============================\n\n"
      puts "Press Enter to continue ..."
      user_response = gets.chomp

      break

    end

    puts "===>>>> Do you want another card or stay/stick #{username}?"
    puts "<<<<=== Press Enter deal or s to stay/stick\n\n"

    user_response = gets.chomp

    if user_response =="s"

        puts "You chose to stay/stick\n\n"
        #puts "#{@current_player_cards}\n\n"
        #puts "Your cards total to #{@player_card_number_total}\n\n"
        puts "========================YOUR TURN ENDED==========================="
        
        deal_card
        card = @card.to_s.tr '"[]',''
        dealers_cards = {card => @dealer_card_number}
        dealers_hand(dealers_cards)
        
        while true

          puts "==========================DEALER TURN============================="
          puts "Dealing, please wait >>>>>>>>>\n\n"

          sleep 1

          deal_card
          card = @card.to_s.tr '"[]',''
          dealers_cards.merge! card => @dealer_card_number

          #p "&&&&DEBUG INFO: (Dealer Cards that HAVE being dealt) #{dealers_cards}&&&&&"

          dealers_hand(dealers_cards)
          
          if @dealer_card_number_total >= 22 && @eleven_found >= 1

            @dealer_card_number_total = @dealer_card_number_total - (10 * @eleven_found)

          end

          show_cards(@current_dealer_cards, @dealer_card_number_total)

          puts "please wait >>>>>>>>>\n\n"

          sleep 4

          if @dealer_card_number_total >= 17
            
            puts "=======================DEALER TURN ENDED===========================\n\n"

            puts "=========================GAME SUMMARY=============================="
            puts "Your cards total to #{@player_card_number_total} and Dealer cards total to #{@dealer_card_number_total}"
            

            if @dealer_card_number_total >= 22
              #binding.pry 
              #game_over("YOU WON")
              puts "You won the game #{username}"
            
            elsif @player_card_number_total >= 22
              #binding.pry
              #game_over("YOU LOST")
              puts "You lost the game #{username}"

            elsif @player_card_number_total > @dealer_card_number_total 
              #binding.pry
              #game_over("YOU WON")
              puts "You won the game #{username}"

            elsif @dealer_card_number_total > @player_card_number_total || @dealer_card_number_total == 21
              #binding.pry
              #game_over("YOU LOST")
              puts "You lost the game #{username}"
            
            elsif @dealer_card_number_total == @player_card_number_total
              #binding.pry
              #game_over("YOU TIE")
              puts "You tied the game #{username}"
              
            end

            puts "=========================GAME SUMMARY==============================\n\n"
            puts "Press Enter to continue ..."
            user_response = gets.chomp

            throw :stop
          
          end
          
        end
        
    end 

  end

end

end

#check the card values
#remove the cards from the deck
#reload the deck when finished
#allow the player to hit or stick