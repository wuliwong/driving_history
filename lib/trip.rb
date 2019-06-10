class Trip
  attr_accessor :avg_speed, :distance, :time

  def initialize(trip_array)
    @time = calculate_time(trip_array[2], trip_array[3])

    @distance = trip_array[4].to_f
    @avg_speed = @distance/@time

    unless @avg_speed > 5.0 && @avg_speed < 100.0
      raise "Bad average speed data"
    end
  end

  def calculate_time(start_string, end_string)
    start_array = start_string.split(":")
    end_array = end_string.split(":")

    #convert to minutes
    start_mins = start_array[0].to_i*60.0 + start_array[1].to_i
    end_mins = end_array[0].to_i*60.0 + end_array[1].to_i

    return ((end_mins - start_mins)/60.0)
  end
end