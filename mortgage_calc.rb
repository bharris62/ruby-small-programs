#get loan amount, APR, loan duration in years
#calculate monthly int rate, and loan duration in months
def monthly_interest_rate(apr)
  apr = apr / 12
  return apr.to_f
end

def years_to_month(years)
  periods = years * 12.0
  return periods.to_f
end
fixed_payment = 0
def calculate_loan_amount(rate, n_periods, total_loan_amount)
  fixed_payment = (rate/ (1-((1+rate) ** (n_periods * -1)))) * total_loan_amount
  return fixed_payment.to_f
end

puts "Welcome to loan calculator..."
puts "Can you provide: Loan Amount?"
loan_amount = gets.chomp.to_f#check to see if valid int


puts "Can you provide: APR in whole percent 5 = 5%"
annual_percentage_rate = gets.chomp.to_f
monthly_rate = monthly_interest_rate(annual_percentage_rate)


puts "Can you provide: Loan Duration in years"
loan_duration = gets.chomp.to_i
months = years_to_month(loan_duration)

fixed_loan = calculate_loan_amount(monthly_rate, months, loan_amount)

p fixed_loan
