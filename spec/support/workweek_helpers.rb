module WorkweekHelpers
  def expect_week hash
    describe "week" do
      hash.each do |meth,val|
        describe "##{meth}" do
          specify { subject.send(meth).should eq val }
        end
      end
    end
  end

  def expect_day index, hash
    describe "day #{index}" do
      hash.each do |meth,val|
        describe "##{meth}" do
          specify do
            subject[index].send(meth).should eq val
          end
        end
      end
    end
  end
end
