def low_guess?(guess, num)
  guess < num
end

def high_guess?(guess, num)
guess > num
end

def correct_guess?(guess, num)
  guess == num
end

num = (1..100).to_a.sample
guesses = []
name = `whoami`.strip

puts "Hello, I've thought of a number between 1 and 100."
puts "Think you can guess it in five tries or fewer?"
puts "btw - the number is #{num}"

#until guesses.count >= 5 do
while guesses.count < 5 do
  puts "Please make a guess:"
  print "> "

#case guesses.count
#when 0 then print "> "
#when 1 then print "> "
#when 2 then print "> "
#when 3 then print "> "
#when 4 then print "> "
#when 5 then print "Sorry, no more guesses"
#end

  guess = gets.chomp

  if guess =~ /^-?\d+(\.\d+)?$/
    # Number has been matched
    guess = guess.to_i

    if guesses.include?(guess)
      puts "#{guess} again?! Please don't waste too much of my time, #{name}  : )"
    end

    guesses << guess

    if correct_guess?(guess, num)
      puts "Whoa, you got it.  Nice job!"
      break
    end

    is_low = low_guess?(guess, num)
    is_high = high_guess?(guess,num)

    if is_low && guesses.any?{|g| low_guess?(g, num) && g > guess}
      puts "You should already know that it's higher than that, #{name}  : )"
    elsif is_high && guesses.any?{|g| high_guess?(g, num) && g < guess}
      puts "Come on #{name}, you should know it's lower than that  : )"
    end

#https://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-any-3F


    puts "My number's #{is_low ? 'higher' : 'lower'} than #{guess}.  Try again:"
    print "> "

#is_high = high_guess?(guess, num)


  else
    break if guess == ""

    puts "Sorry, '#{guess}' won't work here; please try again"
    # Any non-numbers get flagged and user tries again

  end
end
