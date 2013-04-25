require 'harvester/workbase'

module Harvester
  class Workday < Workbase
    def self.max_regular
      8
    end
    def self.max_overtime
      4
    end
    def initialize hours
      super     
      account_for_hours hours
    end
  end

  class Workweek < Workbase
    def self.max_regular
      40
    end

    def initialize days
      super
      @days = days.map!{|i| Workday.new(i) }

      if defined? ALEX_DOUBLE_TIME
        if days.reject{|i| i.total == 0}.size == 7
          @total += @doubletime += days.pop.total
        end
      end

      days.each do |day|
        account_for_hours day.total
        self.doubletime += day.doubletime
        self.overtime -= day.doubletime
      end
    end

    def get_day index
      @days[index]
    end

    def to_s
      'hi'
    end
  end
end
