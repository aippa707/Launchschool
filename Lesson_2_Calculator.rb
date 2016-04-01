# Lesson_2_Calculator.rb

# Tasks: 1)Ask user for 2 numbers, 2)ask user for an operation to perform,
# 3)perform the operation, and 4)output the result.
# Use Kernel. to distinguish method calls.

Kernel.puts "You have started the Calculator."
# Gets the first number
Kernel.puts "Please enter an integer."
num1 = Kernel.gets.chomp
# Gets he second number
Kernel.puts "Please enter another integer."
num2 = Kernel.gets.chomp
# Gets the operation
Kernel.puts "What operation would you like to use?"
Kernel.puts "Please enter 1-4 for 1)* 2)/ 3)+ 4)-"
operator = Kernel.gets.chomp.to_s
# Perform the operation
if operator == '1'
  answer = num1.to_i * num2.to_i
elsif operator == '2'
  answer = num1.to_f / num2.to_f
elsif operator == '3'
  answer = num1.to_i + num2.to_i
elsif operator == '4'
  answer = num1.to_i - num2.to_i
else
  puts "You effed it up. Please restart."
end
# Output the result
Kernel.puts "Your answer is:" + answer.to_s
