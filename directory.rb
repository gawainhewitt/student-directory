@students = []

def input_students
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "what is your hobby?"
    hobby = gets.chomp
    if hobby.empty? 
      hobby = "none given"
    end
    hobby.downcase!
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
    @students << {name: name, hobby: hobby, cohort: cohort.to_sym}
    statement = "Now we have #{@students.count} student"
    if @students.length > 1
      statement << "s"
    end
    puts statement
    # get another name from the user
    name = gets.chomp
  end
  # return the array of @students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.length != 0
    idx = 0
    existing_cohorts = {}
    while true
      if idx < @students.length
        if existing_cohorts[@students[idx][:cohort]] == nil
          existing_cohorts[@students[idx][:cohort]] = []
        end
        existing_cohorts[@students[idx][:cohort]].push({name: @students[idx][:name], hobby: @students[idx][:hobby]})
        #puts existing_cohorts
        #puts "#{idx+1}. #{@students[idx][:name]}, whos hobby is #{@students[idx][:hobby]} (#{@students[idx][:cohort]} cohort)".center(100)      
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

def print_footer
  footer_text = "Overall, we have #{@students.count} great student"
  if @students.length > 1
    footer_text << "s"
  elsif @students.length == 0
    footer_text = "We do not have any students!"
  end
  puts footer_text
end

def interactive_menu
  loop do    
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end



interactive_menu
