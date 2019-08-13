class Driver # This returns dummy data for testing the CLI without actually scraping anything
attr_accessor :name, :number, :profile

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

  def self.find_by_number(number)
    @@all.find{ |driver| driver.number == number}
  end

end # of class

