class CLI
  
  def self.welcome
    puts "Welcome to F1 Competitors"
    puts "-------------------------"
    puts "This is a gem that lets you check out the people competing for the Formula One wolrd championship"
    puts ""
    get_driver_list
  end # of welcome
  
   
   def self.get_driver_list
      if Driver.all.length == 0
         Dummy_scraper.scrape_driver_list
      end
    puts "Here is a list of drivers:"
     Driver.all.each{ |driver| 
      puts "#{driver.number}. #{driver.name}"
    }
    get_driver_input
   end
   
   
   def self.get_driver_input
    puts ""
    puts "Please enter a number between 1-#{Driver.all.length}:"
    input = gets.chomp.to_i
    if check_driver_input(input)
      get_driver_details(input)
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
    end
  end
    
   def self.get_driver_details(input)
    puts "SCRAIPING.."
    
   end
end # of class

