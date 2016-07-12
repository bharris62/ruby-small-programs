def prompt(message)
  puts "=>#{message}"
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("welcome to calculator: Enter name!")
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("comeonnn gimma a name")
  else
    break
  end
end

prompt("Howdy #{name}")

loop do # main loop
  num1 = ''
  loop do
    prompt("Whats the first number?")
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt("not a valid number")
    end
  end

  num2 = ''
  loop do
    prompt("Whats the second number?")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("not a valid number")
    end
  end

  prompt("what operation would you like to do?
  1.) add
  2.) subtract
  3.) multiply
  4.) divide")
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("need number 1, 2, 3, 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
  end

  prompt("results is #{result}")
  prompt("would you like to go again? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for calculating with us #{name}!")
