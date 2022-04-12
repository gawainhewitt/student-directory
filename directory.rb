def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  " while the name is not empty, repeat this code"
  while !name.empty? do
    puts "what is your hobby?"
    hobby = gets.chomp
    # add the student hash to the array
    students << {name: name, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  idx = 0
  while true
    if idx < students.length
      puts "#{idx+1}. #{students[idx][:name]}, whos hobby is #{students[idx][:hobby]} (#{students[idx][:cohort]} cohort)".center(100)
      idx += 1
    else
      break
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)