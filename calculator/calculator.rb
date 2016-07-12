require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
def prompt(message)
  puts "=>#{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
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

prompt(MESSAGES['welcome'])# welcome
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])# valid_name
  else
    break
  end
end

prompt(MESSAGES['greeting'] + "#{name}")# greeting

loop do # main loop
  num1 = ''
  loop do
    prompt(MESSAGES['first_num']) # first_num
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['invalid_num']) # invalid_num
    end
  end

  num2 = ''
  loop do
    prompt(MESSAGES['second_num']) # second_num
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['invalid_num']) # invalid_num
    end
  end

  prompt(MESSAGES['op_prompt'])   # op_prompt
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['op_err']) # op_err
    end
  end

  prompt("#{operation_to_message(operator) }" + MESSAGES['calc']) #calc
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

  prompt("results is #{result}") #your_result
  prompt("would you like to go again? (Y/N)") #go_again
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye']+ "#{name}!") #goodbye
