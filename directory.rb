@students = [] # an empty array ccessible by all methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list of students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, try again"
      # 4. repeat from step 1
  end
end

def students_access(name, cohort, age)
  @students << {name: name, cohort: cohort.to_sym, age: age}
end

#let's put all students into an array
def input_students
  puts "Please enter the name, cohort (month), age, for each student"
  puts "To finish, just hit return twice"
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  # get the first name, cohort and age
  puts "Name: "
  name = STDIN.gets.delete("\n").capitalize
  puts "Cohort: "
  cohort = STDIN.gets.delete("\n").capitalize
  # while the name is not empty, repeat this code
  while !months.include?(cohort) && !name.empty?
    puts "Please enter a valid cohort (month)"
    cohort = STDIN.gets.delete("\n").capitalize
  end
  puts "Age: "
  age = STDIN.gets.delete("\n")
  # while the name is not empty, repeat
  while !name.empty? do
    if age.empty?
      age = "33"
    end
    # add the student hash to the array
    students_access(name, cohort, age)
    if @students.count == 1
    puts "Now we have 1 student"
    else
    puts "Now we have #{@students.count} students"
    end

  # get another name, cohort, age from the user
  puts "Name: "
    name = STDIN.gets.delete("\n").capitalize
    if !name.empty?
      puts "Cohort: "
      cohort = STDIN.gets.delete("\n").capitalize
      while !months.include?(cohort) && !name.empty?
        puts "Please enter a valid cohort (month):"
        cohort = STDIN.gets.delete("\n").capitalize
      end
      puts "Age: "
      age = STDIN.gets.delete("\n")
    end
  end

# return the array of students
@students
end

def show_students
  print_header
  print_student_list
  print_footer(@students)
end

def print_header
  puts ""
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
  if @students.count > 0
    @students.group_by {|student| student[:cohort]}.map do |month, students|
      puts ""
      puts "#{month}".center(50, "--")
      students.map{|student| puts "#{student[:name]}".center(50)}
  end
  end
end

def print_footer(students)
  puts "\nOverall, we have #{@students.count} great students".center(50)
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, age = line.chomp.split(',')
    students_access(name, cohort, age)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv" # loads students.csv default if no file name provided
  end

  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
#nothing happens until we call the methods
try_load_students
interactive_menu
