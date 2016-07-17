ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.key?('Herman')
puts ages.key?('Spot')

puts ages.include?('Spot')
puts ages.member?('Spots')
puts ages.include?('Herman')
puts ages.member?('Herman')
