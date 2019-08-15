class Scraper # This returns dummy data for testing the CLI without actually scraping anything

def initialize(url)
  @url = url
  @page = Nokogiri::HTML(open(@url))
 end

def get_driver_list
   @driver_results = @page.css(".nav-list-drivers")
   @driver_results.each { |driver|
   
end
  


  
  


  def scrape_driver_list
   
      @@faked_drivers.each { |driver|
      Driver.new(driver)
      }
      
  end # of scrape_driver_list
  
  
  def scrape_driver_profile(driver)
    @@faked_driver_details.each 
    
  end # of scrape_driver_profile

  
  


end # of class