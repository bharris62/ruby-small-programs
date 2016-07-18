flint = %w(Fred Barney Wilma Betty BamBam Pebbles)

flint.push(['Dino', 'Hobby'])

p flint.flatten

# or

flint2 = %w(Fred Barney Wilma Betty BamBam Pebbles)
flint2.push('Dino').push('Hoppy')

p flint # still will need to be flattened

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.concat(%w(Dino Hoppy))

p flintstones
