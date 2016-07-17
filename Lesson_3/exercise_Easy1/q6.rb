# put "Four score and " in front of it

first_words = "Four score and "
famous_words = "seven years ago..."

puts first_words + famous_words
puts first_words << famous_words  # destructive

# the other method provided by:
famous_words.prepend("Four score and ")
