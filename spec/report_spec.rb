require 'rspec/autorun'
require 'report'
require 'driver'

describe Report do
  it "creates a driver" do
    report = Report.new('lib/input.txt')
    report.parse_line("Driver Dan")

    expect(report.drivers["Dan"]).to be_a(Driver)
  end

  it "ignores lines without enough information" do
    report = Report.new('lib/input.txt')

    expect(report.parse_line("bad")).to eq(nil)
  end
end