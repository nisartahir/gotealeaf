require 'pry'

def deal_card

card_deck = { 'DA' => 11, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'D9' => 9, 'D10' => 10, 'DJ' => 10, 'DQ' => 10, 'DK' => 10, 'HA' => 11, 'H2' => 2, 'H3' => 3, 'H4' => 4 , 'H5' => 5 , 'H6' => 6 , 'H7' => 7 , 'H8' => 8, 'H9' => 9, 'H10' => 10, 'HJ' => 10, 'HQ' => 10, 'HK' => 10,  'CA' => 11, 'C2' => 2, 'C3' => 3, 'C4' => 4 , 'C5' => 5 , 'C6' => 6 , 'C7' => 7 , 'C8' => 8, 'C9' => 9, 'C10' => 10, 'CJ' => 10, 'CQ' => 10, 'CK' => 10,  'SA' => 11, 'S2' => 2, 'S3' => 3, 'S4' => 4 , 'S5' => 5 , 'S6' => 6 , 'S7' => 7 , 'S8' => 8, 'S9' => 9, 'S10' => 10, 'SJ' => 10, 'SQ' => 10, 'SK' => 10 }
#card_deck = { 'DA' => 11, 'D2' => 2, 'D3' => 3, 'D4' => 4 , 'D5' => 5 , 'D6' => 6 , 'D7' => 7 , 'D8' => 8, 'HA' => 11 , 'CA' => 11 , 'SA' => 11, }

  #pull out a random card from all the cards from the deck  

  @card = card_deck.keys.sample(1)
  
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

def pause(duration)
  
  puts "please wait >>>>>>>>>\n"

  (1..duration).each do |pause|
    sleep 0.1
    print '#'

  end

  puts "\n"

end

def show_cards(card_number_total, cards)

    card_grahics(cards)

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

    pause(10)

    deal_card
    card = @card.to_s.tr '"[]',''
    players_cards.merge! card => @player_card_number

    players_hand(players_cards)

    if @player_card_number_total >= 22 && @eleven_found >= 1

     @player_card_number_total = @player_card_number_total - (10 * @eleven_found)
     
    end
    
    show_cards(@player_card_number_total,players_cards)


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

        puts "========================YOUR TURN ENDED==========================="
        
        deal_card
        card = @card.to_s.tr '"[]',''
        dealers_cards = {card => @dealer_card_number}
        dealers_hand(dealers_cards)
        
        while true

          puts "==========================DEALER TURN============================="
          pause(10)

          deal_card
          card = @card.to_s.tr '"[]',''
          dealers_cards.merge! card => @dealer_card_number

          dealers_hand(dealers_cards)
          
          if @dealer_card_number_total >= 22 && @eleven_found >= 1

            @dealer_card_number_total = @dealer_card_number_total - (10 * @eleven_found)

          end

          show_cards(@dealer_card_number_total, dealers_cards)

          pause(25)

          if @dealer_card_number_total >= 17
            
            puts "=======================DEALER TURN ENDED===========================\n\n"

            puts "=========================GAME SUMMARY=============================="
            puts "Your cards total to #{@player_card_number_total} and Dealer cards total to #{@dealer_card_number_total}"
            

            if @dealer_card_number_total >= 22
            
              puts "You won the game #{username}"
            
            elsif @player_card_number_total >= 22
            
              puts "You lost the game #{username}"

            elsif @player_card_number_total > @dealer_card_number_total 
            
              puts "You won the game #{username}"

            elsif @dealer_card_number_total > @player_card_number_total || @dealer_card_number_total == 21
            
              puts "You lost the game #{username}"
            
            elsif @dealer_card_number_total == @player_card_number_total
            
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

#remove the cards from the deck
#reload the deck when finished