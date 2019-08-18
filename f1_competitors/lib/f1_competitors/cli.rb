class CLI
  

  def self.welcome
    puts "Welcome to F1 Competitors"
    puts "-------------------------"
    puts "This is a gem that lets you check out the people competing for the Formula One world championship"
    puts ""
    get_driver_list
  end # of welcome
  
   
   def self.get_driver_list
       
      if Driver.all.length == 0
         Scraper.new("https://www.formula1.com").get_driver_list
      end
    puts "Here is a list of drivers:"
     Driver.all.each { |driver| 
      puts "#{driver.number}. #{driver.name}"
    }
    get_driver_input
   end
   
   
   def self.get_driver_input
    puts ""
    puts "Please enter a number between 1-#{Driver.all.length}:"
    input = gets.chomp.to_i
    if check_driver_input(input)
      get_driver_profile(input)
    else
      puts "Invalid Selection"
      get_driver_input
    end
  end
   
  def self.check_driver_input(input)
    if input >= 0 && input <= Driver.all.length
      true
    else
      false
    end #of conditional
  end #of check_driver_input
    
   def self.get_driver_profile(input)
     selected_driver = Driver.find_by_number(input)
    puts "Loading profile for #{selected_driver.name}..."
    if selected_driver.profile == {}
      puts "Empty profile now scraping"
      Scraper.new(selected_driver.name).get_driver_profile
    end #of conditional
    
    puts selected_driver.profile
  
 end #of get_driver_profile
   
    

  
   


   def driver_list
    puts "Here is a list of drivers:"
    puts Driver.all
    
   end

end # of class

