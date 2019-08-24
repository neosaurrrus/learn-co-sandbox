class Driver

attr_accessor :name, :number, :profile

@@all = []

  def initialize(name)
    @name = name
    @profile = {}
    @number = @@all.length+1
    @@all << self
  end
  
  def self.all
    @@all
  end # of all


  def self.find_by_number(number)
    @@all.find{ |driver| driver.number == number}
  end

end # of class
