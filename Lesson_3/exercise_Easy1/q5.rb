# Programmatically determine if 42 lies between 10 and 100.
#
# hint: Use Ruby's range object in your solution.

# more difficult way
if 42 < 100 && 42 > 0
   puts 'true'
else
  puts 'false'
end

# more ruby way
(10..100).cover?(42)
