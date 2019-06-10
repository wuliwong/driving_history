require 'rspec/autorun'
require 'report'
require 'driver'
require 'trip'

describe Report do
  before(:all) { @report = Report.new('lib/input.txt') }

  it "creates a driver" do
    @report.parse_line("Driver Dan")

    expect(@report.drivers["Dan"]).to be_a(Driver)
  end

  it "ignores lines without enough information" do
    expect(@report.parse_line("bad")).to eq(nil)
  end

  it "creates a trip for a driver" do
    @report.parse_line("Driver Dan")
    @report.parse_line("Trip Dan 07:15 07:45 17.3")

    dan = @report.drivers["Dan"]

    expect(dan.trips.length).to eq(1)
  end

  it "ignores trip for a driver with too slow speed" do
    @report.parse_line("Driver Dan")
    @report.parse_line("Trip Dan 01:15 07:45 1.3")

    dan = @report.drivers["Dan"]

    expect(dan.trips.length).to eq(0)
  end
end