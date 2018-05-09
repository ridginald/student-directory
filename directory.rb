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
def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end
def print_names
  names.each do |name|
    puts name
  end
end
def print_footer (names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
