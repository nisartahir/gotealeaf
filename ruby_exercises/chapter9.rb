#!/usr/bin/ruby

puts "Please type in a word then press ENTER"
puts " "

word = []

while true
	
	word_entered = gets.chomp
	word.push word_entered
	#word.push gets.chomp

	if word_entered == ""
		puts ""
		puts "Good bye!!!"
		break
	end

	puts " "
	puts "You entered the words: " + word.sort.join(" ")

	puts " "
	puts "Please press ENTER to exit the program OR"
	puts "type in another word then press ENTER"
	puts " "

end

