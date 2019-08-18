class Scraper # This scrapes data from the f1 webpage.



def initialize(driver = nil)
  @url = "https://www.formula1.com"
  @driver_url = "https://www.formula1.com/en/drivers/"
  @driver = driver
end  



def get_driver_list
   @page = Nokogiri::HTML(open(@url))
   @page.css(".driver").each { |driver|
   Driver.new(driver.text.split(" ").join(" "))
   }
   @driver_results = @page.css(".nav-list-drivers")
   @driver_results.each { |driver|
   Driver.new(driver)
  }
end
  

  

  def get_driver_profile
    puts driver_profile_url
  end
  

  def driver_profile_url
    split_driver_name = @driver.downcase.split(" ")
    driver_url = split_driver_name.join("-")
    "#{@driver_url}#{driver_url}"
  end

# https://www.formula1.com/en/drivers/lewis-hamilton.html

end # of class