require 'spec_helper'

describe Overtimer::Workweek do
  context 'standard' do
    subject { Overtimer::Workweek.new [8,8,8,8,8,0,0] }
    expect_week({
      total:40,
      regular:40,
      overtime:0,
      doubletime:0
      })
  end

  context 'worked on Saturday' do
    subject { Overtimer::Workweek.new [8,8,8,8,8,8,0] }
    expect_week({
      total:48,
      regular:40,
      overtime:8,
      doubletime:0
      })
  end

  context 'worked on Saturday and Sunday' do
    # Alex Says: The seventh consecutive day is considered doubletime
    # Ruthy Says: Joann's rules make above untrue
    subject { Overtimer::Workweek.new [8,8,8,8,8,8,8] }
    expect_week({
      total:56,
      regular:40,
      overtime:16,
      doubletime:0
      })
  end

  context 'worked hard' do
    subject { Overtimer::Workweek.new [17,12,15,11,12,4,0] }
    expect_day(0, {
      total:17,
      regular:8,
      overtime:4,
      doubletime:5
      })
    expect_week({
      total:71,
      regular:40,
      overtime:23,
      doubletime:8
      })
  end

  context 'worked soft' do
    subject { Overtimer::Workweek.new [7,5,3,4,0,0,0] }
    expect_week({
      total:19,
      regular:19,
      overtime:0,
      doubletime:0
      })
  end
end
