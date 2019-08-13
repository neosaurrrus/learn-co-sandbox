class Driver # This returns dummy data for testing the CLI without actually scraping anything
attr_accessor :name, :number

@@all = []
  def initialize(name)
    @name = name
    @number = @@all.length+1
    @profile = {}
    @@all << self
  end
  
  def self.all
    @@all
  end # of all

  def self.find_by_name(driver_name)
    @@all.find{ |driver| driver.name == driver_name}
  end

end # of class

