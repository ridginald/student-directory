#first we print the list of students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
# and then print them
puts "The students of Villians Academy"
puts "-------------"

students.each do |student|
  puts students
end
# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
