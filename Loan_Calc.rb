# loan_calc.rb

# Objectives: User input loan amount, apr, and loan duration.
# Calculate and output monthly interest rate and loan duration.

# YAML
require 'yaml'
M = YAML.load_file('Loan_Calc.yml')
# Variables
name = ''
principle = ''
apr = ''
duration = ''
interest = ''
yesno = ''
payment = ''
# Line Prompt
def prompt(message)
  puts("~ #{message}")
end
# Number Validation
def valid_number?(num)
  case(num)
    when /\A\s*[+-]?\d+\.\d+\z/
      num.to_f
    when /\A\s*[+-]?\d+(\.\d+)?[eE]\d+\z/
      num.to_f
    when /\A\s*[+-]?\d+\z/
      num.to_i
    else nil
  end
end
# Welcome message
prompt(M['welcome'])
# Get User name
prompt(M['enter_name'])
loop do
  name = gets.chomp.to_s
  if name.empty?
    prompt(M['name_error'])
  else
    break
  end
end
# Greet User
prompt(M['greeting'] + name + '!')
# Start Main Loop
loop do
  # Gets Principle
prompt(M['get_principle'])
  loop do
    principle = gets.chomp
      if valid_number?(principle)
        break
      else
        prompt(M['principle_error'])
      end
  end
  # Gets Loan Duration
prompt(M['get_duration'])
  loop do
    duration = gets.chomp
      if valid_number?(duration)
        break
      else
        prompt(M['duration_error'])
      end
  end
    # Gets Interest Rate
prompt(M['get_interest'])
    loop do
      interest = gets.chomp
        if valid_number?(interest)
          break
        else
          prompt(M['interest_error'])
        end
    end
# I don't know why this part doesn't work.
# Calculate Payment
payment = principle * ((apr * (1 + apr))**duration) / (1 - ((1 + apr)**duration))
# Output
prompt(M['result'] + payment + ' for ' + duration + ' months at ' + apr + ' interest compounded monthly.')
prompt(M['continue'])
  yesno = gets.chomp.to_s
  break unless yesno.downcase.start_with?('y')
end
prompt(M['exit'] + name + '!')
