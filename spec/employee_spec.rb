require 'spec_helper'

describe Harvester::Employee do
  before(:all) do
    @employee = Harvester::Employee.new
  end
  describe "#hours" do
    context 'single day' do
      let (:date) { Date.new(2013, 04, 22) }
      it "downloads hours worked on date" do
        @employee.hours(date).should eq 8
      end
    end
    context 'date range' do
      let (:start_date) { Date.new(2013, 03, 25) }
      let (:end_date) { Date.new(2013, 03, 27) }
      it "downloads total hours for the date range" do
        @employee.hours(start_date..end_date).should eq 25
      end
    end
    context 'multiple clients (DFT and DFTi)' do
      let (:date) { Date.new 2013, 04, 04 }
      it 'downloads total hours by summing clients' do 
        @employee.hours(date).should eq 13
      end
    end
  end
end