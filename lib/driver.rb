class Driver
  attr_accessor :name, :trips, :total_time, :total_distance, :avg_speed
  def initialize(name)
    @name = name
    @trips = []
    @total_time = 0.0
    @total_distance = 0.0
    @avg_speed = 0.0
  end

  def add_trip(trip)
    @trips.push(trip)
    @total_time = @total_time + trip.time
    @total_distance = @total_distance + trip.distance
    @avg_speed = @total_distance/@total_time
  end

  def trip_summary
    return "#{@name}: #{@total_distance.round} miles @ #{@avg_speed.round} mph"
  end
end