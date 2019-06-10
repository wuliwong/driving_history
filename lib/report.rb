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
    words = line.split(" ")

    if words.length < 2
      return nil
    elsif words[0] == "Driver"
      driver = Driver.new(words[1])
      @drivers[driver.name] = driver
    end
  end
end