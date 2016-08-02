require 'pry'

CARDS = %w( 2 3 4 5 6 7 8 9 10 J Q K A )

SUITS = {
    H: 'Hearts',
    S: 'Spades',
    D: 'Diamonds',
    C: 'Clubs'
}

def prompt(str)
  puts "=> #{str}"
end

def validate_answer(ans)
  loop do
    if ans == 'h' || ans == 's'
      break
    elsif
      'Please input h/s'
    end
  end
end

# pass in an array and calculate value.
def calculate_hand(hand)
  values = hand
  hand_result = 0

  values.each do |val|
    if val == 'A'
      hand_result += 11
    elsif val.to_i == 0
      hand_result += 10
    else
      hand_result += val.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    hand_result -= 10 if hand_result > 21
  end

  hand_result
end


# main game loop
loop do
  player = CARDS.sample(2)
  dealer = CARDS.sample(2)


  p calculate_hand(player.flatten)
  prompt "players has #{player[0]} & #{player[1]} for total of #{calculate_hand(player.flatten)}"
  prompt "Would you like to hit or stand? (h/s)"

  loop do
    answer = gets.chomp.downcase
    if answer == 'h' || answer == 's'
      player << CARDS.sample(1)
      break
    elsif
      prompt 'Please input h/s'
    end
  end

  prompt "players has #{player[0]} & #{player[1]} for total of #{calculate_hand(player.flatten)}"
  prompt "Would you like to hit or stand? (h/s)"
end