require 'rspec/autorun'
require 'report'
require 'driver'
require 'trip'

describe Trip do
  before(:all) { @trip = Trip.new("Trip Dan 07:15 07:45 17.3".split(" ")) }

  it "calculates trip time" do
    expect(@trip.calculate_time("03:21", "09:01")).to eq(340.0)
  end
end