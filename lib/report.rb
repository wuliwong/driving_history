class Report
  attr_accessor :file
  attr_accessor :drivers

  def initialize(input_file)
    if input_file.nil?
      raise "Must supply input file"
    else
      @file = input_file
    end

    @drivers = {}
  end

  def process_input_file 
    File.open(@file, "r") do |f|
      f.each_line do |line|
        parse_line(line)
      end
    end
  end

  def parse_line line
    line_array = line.split(" ")

    if line_array.length < 2
      return nil
    elsif line_array[0] == "Driver"
      driver = Driver.new(line_array[1])
      @drivers[driver.name] = driver
    elsif line_array[0] == "Trip"
      if driver = @drivers[line_array[1]]

        driver.trips.push(Trip.new(line_array))
      end
    end
  end
end