class CLI
  
  def self.welcome
    puts "\nWelcome to...\n".blue.bold
    puts" _    _              /'_'_/.-''/                             _______".red
    puts" \\`../ |o_..__      / /__   / /  -= COMPETITORS =-          _\\=.o.=/_".red
    puts"`.,(_)______(_).>  / ___/  / /                             |_|_____|_|".red
    puts"~~~~~~~~~~~~~~~~~~".green + "/_/".red + "~~~~~".green + "/_/".red + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".green
    puts "\nThis is a gem that lets you check out the people competing for the Formula One  World Championship!".light_blue.bold
    view_driver_list
  end # of welcome

   def self.view_driver_list
      if Driver.all.length == 0
         Scraper.new("https://www.formula1.com").get_driver_list
      end
      puts "Here is a list of drivers competing this year:\n".light_blue
      Driver.all.each { |driver| 
        puts "#{driver.number.to_s.blue}. #{driver.name}"
      }
      user_driver_input
   end
   
   def self.user_driver_input
    puts ""
    puts "\nPlease enter a number between 1-#{Driver.all.length}:"
    input = gets.chomp
    if check_driver_input(input)
      get_driver_profile(input.to_i)
    else
      puts "Invalid Selection. Please choose between 1 and #{Driver.all.length}".red
      user_driver_input
    end
  end
   
  def self.check_driver_input(input)
    input.to_i > 0 && input.to_i <= Driver.all.length && numeric?(input)
  end #of check_driver_input
    
   def self.get_driver_profile(input)
    selected_driver = Driver.find_by_number(input)
    variable_underline(selected_driver.name.length+8)
    puts "#{selected_driver.name} Profile".blue.bold
    variable_underline(selected_driver.name.length+8)
    selected_driver.profile = Scraper.new(selected_driver.name).get_driver_profile if selected_driver.profile == {}
    selected_driver.profile.each{ |key, value|
      puts "#{key.blue} : #{value}"
    }
    variable_underline(selected_driver.name.length+8)
    user_post_profile_input
  end #of get_driver_profile
   
  def self.user_post_profile_input
    puts "\n1.".light_blue + "Return to driver_list" + "\n2.".light_blue + "Quit"
    input = gets.chomp.to_i
    if input == 1 
      view_driver_list
    elsif input == 2 
      puts "Thanks for using F1 Competitors!"
    else
      puts "\nInvalid input, 1 or 2 please! "
      user_post_profile_input
    end # of conditional
  end # of user_post_profile_input

  def self.variable_underline(line_length)
    line = ""
    line_length.times do
      line += "-"
    end
    puts line.yellow.bold
  end
  

  def self.numeric?(input)
      Float(input) != nil rescue false # this is considered bad form!
    end

end # of class

