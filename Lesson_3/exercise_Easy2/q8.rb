flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

firstInst = flintstones.index {|name| name[0,2] == 'Be'}

puts firstInst # returns index 3; or Be in Betty.  
