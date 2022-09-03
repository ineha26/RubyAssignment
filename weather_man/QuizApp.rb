require 'csv'

user = "Y"
while user.upcase == "Y" || user.upcase == "YES"
  totalQuestions = 0
  correctAns = 0
  quiz  = CSV.read("problems.csv")
  quiz.each do |question|
    puts "Question: #{question[0]}"
    print "Answer:"
    answer = gets.chomp
    if answer == question[1]
      correctAns += 1
    end
    totalQuestions += 1
  end
  puts "Your Final Result !"
  puts "Total Questions: #{totalQuestions}"
  puts "Correct: #{correctAns}"
  print "\nDo You want to Re-attempt (Y/N):"
  user = gets.chomp
end
puts "Hope to see you again. Bye :)"

