class DateP < Date

  module Converters

    def next_week
      self + 7
    end

    def weekday_name
      self.strftime('%A')
    end

    def month_name
      self.strftime('%B')
    end

    def start_of_week
      self - cwday
    end

    def start_of_month
      self - day + 1
    end

    def start_of_year
      self - yday + 1
    end

    def end_of_week
      self + (6 - cwday)
    end

    def end_of_month
      self.class.new(year, month, -1)
    end

    def end_of_year
      self.class.new(year, -1, -1)
    end
  end
end
