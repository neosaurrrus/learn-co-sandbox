class Scraper # This scrapes data from the f1 webpage.


  def initialize(driver = nil)
    @url = "https://www.formula1.com"
    @driver_url = "https://www.formula1.com/en/drivers/"
    @driver = driver
  end  
  
  def get_driver_list
     @page =  Nokogiri::HTML(open(@url))
     @page.css(".driver").each { |driver|
     Driver.new(driver.text.split(" ").join(" "))
     }
     @driver_results = @page.css(".nav-list-drivers")
     @driver_results.each { |driver|
     Driver.new(driver)
    }
  end
  
 def get_driver_profile
     profile = {}
     profile_page = Nokogiri::HTML(open(driver_profile_url))
     profile_results = profile_page.css(".stat-list")
     profile_keys = profile_results.css(".stat-key").map { | profile_key | profile_key.text.strip }
     profile_values = profile_results.css(".stat-value").map { | profile_value | profile_value.text.strip }
     profile_keys.each_with_index { | key, index | 
      profile[key] = profile_values[index]
     }
     profile
  end # of get_driver_profile
  

  def driver_profile_url
    split_driver_name = @driver.downcase.split(" ")
    driver_url = split_driver_name.join("-")
    return "#{@driver_url}#{driver_url}.html"
  end # of driver_profile_url


end # of class
