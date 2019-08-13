class Dummy_scraper # This returns dummy data for testing the CLI without actually scraping anything

@@faked_drivers = [
    "Andrew Aaronson",
    "Billy Belcher", 
    "Carly Cat", 
    "Denise Dam",
    "Egbert Echo",
    "Fred Foxtrot", 
    "Gemma Gamma", 
    "Harriet Hotel", 
    "Ingrid India", 
    "Jason June", 
    "Kevin Kilo",
    "Lisa Lamp",
    "Mike Magpie",
    "Ned November",
    "Oscar Oscar",
    "Petra Pint",
    "Quentin Quick",
    "Rusty Robot",
    "Susan Smith",
    "Terry Train"
    ]

@@faked_driver_details = [
    "Alfa Romeo",
    "Finland",
    "103",
    "1847",
    "306",
    "1",
    "1 (x21)",
    "1",
    "17/10/1979",
    "Espoo, Finland"
  ]

  def self.scrape_driver_list
   
      @@faked_drivers.each { |driver|
      Driver.new(driver)
      }
      
  end # of scrape_index
  
  
  def self.scrape_driver_profile(driver)
    driver.profile[:data] = @@faked_driver_details
  end # of scrape_driver_profile


end # of class