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

  def self.scrape_index
    @@faked_drivers
  end # of scrape_index
  
  def self.scrape.driver_details
    @@faked_driver_details
  end
  
  # def driver_details(dummy) = 
  #   team: "Alfa Romeo",
  #   country: "Finland",
  #   codiums: "103",
  #   points:	"1847",
  #   grands_prix_entered: "306",
  #   world_championships:"1",
  #   highest_race_finish:"1 (x21)",
  #   highest_grid_position: "1",
  #   date_of_birth: "17/10/1979",
  #   place_of_birth:	"Espoo, Finland"
  # }

end # of class