module Harvester
  class Employee
    def hours(time)
      if time.is_a? Range
        hours_for_range time
      else
        hours_for_date time
      end
    end

    def hours_for_date date
      data = Harvester::Company.harvest.time.all(date)
      hours = data.map{|i| i['hours']}.compact.reduce(:+)
      hours.nil? ? 0 : hours
    end

    def hours_for_range range
      range.entries.map{|date|hours_for_date(date)}.reduce(:+)
    end
  end
end