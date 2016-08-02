# Tic Tac toe
require 'pry'
INITITAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze # diagonols

def prompt(msg)
  puts "=>#{msg}"
end

def joinor(arr, del = ', ', word= 'or')
  if arr.size > 1
    arr[-1] = "#{word} #{arr.last}"
  end
  arr.size == 2 ? arr.join('') : arr.join(del)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITITAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITITAL_MARKER }
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose a square, #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'not a valid choice'
  end
  brd[square] = PLAYER_MARKER
end

def end_game?
  exit(false)
end

def comp_places_piece!(brd)
  square = nil

  # OFFENSE
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # DEFENSE
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if brd[5] == ' '
      brd[5] = COMPUTER_MARKER
    else
      square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(brd, wins)
  wins[:player] += 1 if detect_winner(brd) == "Player"
  wins[:computer] += 1 if detect_winner(brd) == "Computer"
  wins[:tie] += 1 if board_full?(brd)
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITITAL_MARKER }.keys.first
  end
end

def who_go_first(brd)
  if CHOOSE_ORDER == 'c'
    comp_go_first(brd)
  else
    player_go_first(brd)
  end
end

def player_go_first(brd)
  player_places_piece!(brd)
  comp_places_piece!(brd)
end

def comp_go_first(brd)
  comp_places_piece!(brd)
  display_board(brd)
  if someone_won?(brd) || board_full?(brd)
    return
  end
  player_places_piece!(brd)
end

scoreboard = { computer: 0, player: 0, tie: 0 }

prompt 'P or C? '
ans = ''
loop do
  ans = gets.chomp.downcase
  break if ans == 'p' || ans == 'c'
  prompt 'not a valid choice'
end

loop do
  board = initialize_board
  CHOOSE_ORDER = ans
  loop do
    display_board(board)
    who_go_first(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  update_score(board, scoreboard)

  prompt "SCORE: Player: #{scoreboard[:player]}
  Computer: #{scoreboard[:computer]}
  Ties: #{scoreboard[:tie]}"

  if scoreboard[:player] == 5
    prompt 'You Won! WooHoo'
    exit(false)
  elsif scoreboard[:computer] == 5
    prompt 'You are a loser, ;('
    exit(false)
  end

  prompt "Play Again? (y or n)"
  loop do
    answer = gets.chomp.downcase
    if answer == 'y'
      break
    elsif answer == 'n'
      puts "Thanks for Playing!"
      end_game?
    else
      puts "please use y/n"
    end
  end
end
