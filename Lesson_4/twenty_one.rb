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

def hit(user)
  user << CARDS.sample
  user.flatten
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

  loop do
    prompt "players has | #{player.join(', ')} | total: #{calculate_hand(player.flatten)}"
    has_21?(player)
    prompt "Would you like to hit or stand? (h/s)"

    loop do
      answer = gets.chomp.downcase
      if answer == 'h' || answer == 's'
        hit(player)
        break
      elsif
        prompt 'Please input h/s'
      end
    end
  end

  end