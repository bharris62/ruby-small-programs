# add up all ages in hash

ages = { "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237 }

puts ages.values.inject(:+)
puts ages.values.reduce(:+) # also works. 
