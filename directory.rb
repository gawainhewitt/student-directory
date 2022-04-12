def input_students
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
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
    if hobby.empty? 
      hobby = "none given"
    end
    puts "what is your cohort?"
    cohort = gets.chomp
    cohort_check = false
    while true
      if cohort.empty? 
        cohort = "november"
      end
      cohort.downcase!  
      cohorts.each do |month|
        if cohort == month
          cohort_check = true
        end
      end
      if cohort_check
        break
      end
      puts "you've made a typo"
      puts "what is your cohort?"
      cohort = gets.chomp
    end
    # add the student hash to the array
    students << {name: name, hobby: hobby, cohort: cohort.to_sym}
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
  existing_cohorts = {}
  while true
    if idx < students.length
      if existing_cohorts[students[idx][:cohort]] == nil
        existing_cohorts[students[idx][:cohort]] = []
      end
      existing_cohorts[students[idx][:cohort]].push({name: students[idx][:name], hobby: students[idx][:hobby]})
      #puts existing_cohorts
      #puts "#{idx+1}. #{students[idx][:name]}, whos hobby is #{students[idx][:hobby]} (#{students[idx][:cohort]} cohort)".center(100)      
      idx += 1
    else
      break
    end
  end
  existing_cohorts.each do |cohort, array|
    puts cohort
    array.each do |student|
      puts "#{student[:name]} who's hobby is #{student[:hobby]}"
    end
    puts " "
  end

  
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)