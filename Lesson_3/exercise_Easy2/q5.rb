ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

new_hash = ages.merge(additional_ages) # non destructive way
puts ages.merge!(additional_ages) # destructive method

puts new_hash
