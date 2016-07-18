puts "the value of 40 + 2 is " + (40 + 2).to_s
# this throws an error, why and how to fix it?

# it is because you are trying to concatinate an int to a string
#  add to_s

# or string interpolation

puts "the value of 40 + 2 is #{40 + 2}"
