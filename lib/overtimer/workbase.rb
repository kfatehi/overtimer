module Overtimer
  class Workbase
    attr_reader :total, :regular, :overtime
    attr_accessor :doubletime
    def max_regular
      self.class.max_regular
    end

    def max_overtime
      if self.class.respond_to? :max_overtime
        self.class.max_overtime
      else
        999
      end
    end

    def initialize *args
      @total = 0
      @regular = 0
      @overtime = 0
      @doubletime = 0
    end

    def regular=(val)
      @regular = val
      if @regular >= max_regular
        overflow = @regular - max_regular
        self.overtime += overflow
        @regular -= overflow
      end
    end

    def overtime=(val)
      @overtime = val
      if @overtime >= max_overtime
        overflow = @overtime - max_overtime
        self.doubletime += overflow
        @overtime -= overflow
      end
    end

    def account_for_hours hours
      if @regular <= max_regular
        self.regular += hours
      else
        self.overtime += hours
      end
      @total += hours
    end
  end
end
