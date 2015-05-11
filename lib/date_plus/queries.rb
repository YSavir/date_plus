class DateP
  module Queries

    def next_week
      self + 7
    end

    def start_of_week(opts={})
      opts[:monday] ? self - (cwday - 1) : self - cwday
    end

    def end_of_week(opts={})
      opts[:monday] ? self + (7 - cwday) : self + (6 - cwday)
    end

    def start_of_month
      self - (day - 1)
    end

    def end_of_month
      self.class.new(year, month, -1)
    end

    def start_of_year
      self - (yday - 1)
    end

    def end_of_year
      self.class.new(year, -1, -1)
    end

    def find_next_weekday(weekday)
      unless WEEKDAY_NAMES.include? weekday.downcase
        raise InvalidWeekdayError, "\"#{weekday}\" is not a valid weekday"
      end
      self.step(next_week).reverse_each do |date|
        return date if date.weekday_name.downcase == weekday.downcase
      end
    end
  end
end
