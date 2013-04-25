require 'spec_helper'

describe Harvester::Company do
  describe "#harvest" do
    specify { subject.harvest.should be_a Harvest::HardyClient }
  end
end