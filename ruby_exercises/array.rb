#odd_numbers_array = []
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.push 11 # add 11 to the end of the array

p numbers.last # show the last no

numbers.unshift 0 # add zero to the start of the array

p numbers.first # show the first no in the array

p numbers

numbers.pop # remove the last no

p numbers

numbers.push 3

p numbers

p numbers.uniq

p numbers

#odd_numbers = numbers.select {|x| x % 2 != 0} #select odd nos
#odd_numbers.each do |x|
#  p x
#  odd_numbers_array.push x#create a new array of the odd nos
#end

#p odd_numbers_array

