class Scraper # This returns dummy data for testing the CLI without actually scraping anything

def initialize(url, driver  = nil)
  @url = "https://www.formula1.com"
  @driver_url = "https://www.formula1.com/en/drivers/"
  @driver = driver
  
 end

def get_driver_list
   @page = Nokogiri::HTML(open(@url))
  @page.css(".driver").each { |driver|
     Driver.new(driver.text.split(" ").join(" "))
  }
end
  

  
  def get_driver_profile
   build_url
   @page = Nokogiri::HTML(open(@url))
   @driver_results = @page.css(".nav-list-drivers")
   @driver_results.each { |driver|
      Driver.new(driver)
  }
  end # of scrape_driver_profile

  def build_url
    puts "#{@url}



end # of class