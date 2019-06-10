class Trip
  attr_accessor :avg_speed, :distance

  def initialize(trip_array)

  end

  def calculate_time(start_string, end_string)
    start_array = start_string.split(":")
    end_array = end_string.split(":")

    #convert to minutes
    start_mins = start_array[0].to_i*60.0 + start_array[1].to_i
    end_mins = end_array[0].to_i*60.0 + end_array[1].to_i

    return end_mins - start_mins
  end
end