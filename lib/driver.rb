class Driver
  attr_accessor :name, :trips
  def initialize(name)
    @name = name
    @trips = []
  end
end