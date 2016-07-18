# Create a hash that expressed how many times each letter occurs

statement = "The Flintstones Rock"

result = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |let|
  occurance = statement.scan(let).count
  result[let] = occurance if occurance > 0
end

puts result
