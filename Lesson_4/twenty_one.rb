require 'pry'

CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze

SUITS = {
  H: 'Hearts',
  S: 'Spades',
  D: 'Diamonds',
  C: 'Clubs'
}.freeze

def prompt(str)
  puts "=> #{str}"
end

# def score_21?(score)
#   score == 21
# end

def hit(user)
  user << CARDS.sample
  user.flatten
end

# pass in an array and calculate value.
def calc_hand(hand)
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

def calc_winner(player, computer)
  if player > 21
    prompt "Dealer Wins"
  elsif computer > 21
    prompt 'Player Wins'
  elsif player == computer
    prompt "It's a Push"
  elsif player > computer
    prompt 'Player Wins'
  else
    prompt "Dealer Wins"
  end
end

def log_score(player, computer, scoreboard)
  if calc_winner(player, computer)  ==  "It's a Push"
    scoreboard[:tie] += 1
  elsif calc_winner(player, computer) == 'Player Wins'
    scoreboard[:player] += 1
  else
    scoreboard[:computer] += 1
  end
end

scoreboard = { computer: 0, player: 0, tie: 0 }

# main game loop
loop do
  loop do
    player = CARDS.sample(2)
    dealer = CARDS.sample(2)
    prompt "players |#{player.join(', ')}| total: #{calc_hand(player.flatten)}"
    prompt "computer |#{dealer[0]} & [?]"

    loop do
      break if calc_hand(player.flatten) > 21

      prompt "Would you like to hit or stand? (h/s)"
      answer = gets.chomp.downcase
      if answer == 'h'
        hit(player)
      elsif answer == 's'
        break
      else
        prompt 'Please input h/s'
      end
      prompt "player |#{player.join(', ')}| total: #{calc_hand(player.flatten)}"
    end

    loop do
      dealer_score = calc_hand(dealer.flatten)
      break if calc_hand(player.flatten) > 21
      if dealer_score == 21
        break
      elsif dealer_score > calc_hand(player.flatten)
        break
      elsif dealer_score <= 17
        hit(dealer)
      else
        break
      end
    end

    puts "PLAYER HAND: #{player.join(', ')} total: #{calc_hand(player.flatten)}"
    puts "COMP HAND: #{dealer.join(', ')} total: #{calc_hand(dealer.flatten)}"

    puts 'Player Busted' if calc_hand(player.flatten) > 21
    puts 'Dealer Busted' if calc_hand(dealer.flatten) > 21

    calc_winner(calc_hand(player.flatten), calc_hand(dealer.flatten))

    log_score(calc_hand(player.flatten), calc_hand(dealer.flatten), scoreboard)

    prompt "SCORE: Player: #{scoreboard[:player]}
    Dealer: #{scoreboard[:computer]}
    Ties: #{scoreboard[:tie]}"

    if scoreboard[:player] == 5
      prompt 'You Won! WooHoo'
      exit(false)
    elsif scoreboard[:computer] == 5
      prompt 'You are a loser, ;('
      exit(false)
    end

    prompt 'Play again? y/n'
    loop do
      ans = gets.chomp.downcase
      if ans == 'y'
        system 'clear'
        break
      elsif ans == 'n'
        prompt 'thanks for playing!'
        exit(false)
      else
        prompt 'please use y or n'
      end
    end
  end
  break
end
