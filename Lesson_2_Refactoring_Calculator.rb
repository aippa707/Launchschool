# Lesson_2_Refactoring_Calculator.rb
# Lesson_2_Calculator.rb

# Tasks: 1)Ask user for 2 numbers, 2)ask user for an operation to perform,
# 3)perform the operation, and 4)output the result.
# Use Kernel. to distinguish method calls.
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Variables
num1 = ''
num2 = ''
operator = ''
yesno = ''
name = ''

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['enter_name'])
  # Get user name
loop do
  name = Kernel.gets.chomp.to_s
  if name.empty?
    prompt(MESSAGES['valid_name'])
      else
        break
    end
  end
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

prompt(MESSAGES['welcome_name'])

loop do #main loop
  # Gets the first number
  loop do
    prompt(MESSAGES['number'])
    num1 = Kernel.gets.chomp
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end
  # Gets the second number
  loop do
    prompt(MESSAGES['number'])
    num2 = Kernel.gets.chomp
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end
  # Gets the operation
  prompt(MESSAGES['operation'])
  loop do
    prompt(MESSAGES['operator'])
    operator = Kernel.gets.chomp.to_s
    if %w(1 2 3 4).include?(operator)
      break
    else prompt(MESSAGES['valid_operator'])
    end
  end
  # Perform the operation
  answer = case operator
    when '1'
      num1 * num2
    when '2'
      num1 / num2
    when '3'
      num1 + num2
    when '4'
      num1 - num2
  end
  # Output the result
  prompt(MESSAGES['answer'] + ' ' + answer.to_s)
  prompt(MESSAGES['continue'])
    yesno = Kernel.gets.chomp.to_s
    break unless yesno.downcase.start_with?('y')
end
prompt(MESSAGES['exit'])
