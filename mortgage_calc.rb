# get loan amount, APR, loan duration in years
# calculate monthly int rate, and loan duration in months

# Take rate from yearly to monthly
def monthly_interest_rate(apr)
  apr = (apr / 100.to_f) / 12
  apr.to_f
end

def prompt(str)
  puts "=>#{str}"
end

# takes the years and makes them into monthly periods
def years_to_month(years)
  periods = years * 12.0
  periods.to_f
end

# calculate fixed loan payment
def calculate_loan(rate, n_periods, total_loan_amount)
  fixed_payment = (rate /
                  (1 - ((1 + rate)**(n_periods * - 1)))) * total_loan_amount

  fixed_payment.to_f
end

loop do
  prompt('Welcome to loan calculator...')
  prompt('Can you provide: Loan Amount?')

  # check for valid input
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt('You must enter a valid, positive, number')
    else
      break
    end
  end

  prompt('Can you provide: APR in whole percent 5 = 5%')
  # check for valid input
  annual_rate = ''
  loop do
    annual_rate = gets.chomp
    if annual_rate.empty? || annual_rate.to_f < 0
      prompt('You must enter a valid, positive, number')
    else
      break
    end
  end

  monthly_rate = monthly_interest_rate(annual_rate.to_f)

  prompt('Can you provide: Loan Duration in years')

  loan_duration = ''
  loop do
    loan_duration = gets.chomp
    if loan_duration.empty? || loan_duration.to_i < 0
      prompt('You must enter a valid, positive, number')
    else
      break
    end
  end

  months = years_to_month(loan_duration.to_f)

  fixed_loan = calculate_loan(monthly_rate.to_f, months.to_f, loan_amount.to_f)
  puts "**********************"
  prompt("PMT:    $#{fixed_loan.round(2)}
  PERIOD: #{loan_duration} years
  RATE:   #{annual_rate}%")
  prompt('Would you like to experiment some more? y/n')
  end_res = gets.chomp.downcase
  break unless end_res.downcase.start_with?('y')
end

prompt("See Ya!  Thanks for calculating with us :)")
