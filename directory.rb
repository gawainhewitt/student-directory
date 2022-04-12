def input_students
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat this code
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
    statement = "Now we have #{students.count} student"
    if students.length > 1
      statement << "s"
    end
    puts statement
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
  if students.length != 0
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
      puts "Cohort: #{cohort.capitalize}"
      array.each do |student|
        puts "We have student #{student[:name].capitalize} who's hobby is #{student[:hobby]}".center(100)
      end
      puts " "
    end
  end
end

def print_footer(names)
  footer_text = "Overall, we have #{names.count} great student"
  if names.length > 1
    footer_text << "s"
  elsif names.length == 0
    footer_text = "We do not have any students!"
  end
  puts footer_text
end

def interactive_menu
  students = []
  loop do     # 4. repeat from step 1
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
