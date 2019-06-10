require './lib/driver'
require './lib/trip'

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
        begin
          driver.add_trip(Trip.new(line_array))
        rescue => e
          puts e
        end
      end
    end
  end

  def create_report
    File.open("output.txt", 'w') do |file|
      @drivers.sort_by{|name, driver| -driver.total_distance }.each do |name, driver|
        summary = driver.trip_summary
        file.write(summary)
        file.write("\n")
        puts summary
      end
    end
  end
end