class DateP

  # Methods that return new DateP objects based on the current date
  
  module Queries

    # Get same weekday of the following week
    #
    # @return [DateP] Same weekday of the following week
    
    def next_week
      self + 7
    end

    # Get same weekday of the previous week
    #
    # @return [DateP] Same weekday of the previous week

    def prev_week
      self - 7
    end

    # Get the first day of the date's week. Defaults to Sunday.
    #
    # @option opts [Boolean] :monday (false) Whether or not to use Monday as start of the week.
    # @return [DateP] DateP object for the first day of the date's week
    
    def start_of_week(opts=Hash.new(false))
      opts[:monday] ? self - (cwday - 1) : self - cwday
    end

    # Get the last day of date's week. Defaults to Saturday.
    #
    # @option opts [Boolean] :monday (false) Whether or not to use Monday as the start of the week.
    # @return [DateP] DateP object for the last day of the date's week.

    def end_of_week(opts={})
      opts[:monday] ? self + (7 - cwday) : self + (6 - cwday)
    end

    # Get the first day of the date's month.
    #
    # @return [DateP] DateP object for the first day of the date's month.

    def start_of_month
      self - (day - 1)
    end

    # Get the last day of the date's month.
    #
    # @return [DateP] DateP object for the last day of the date's month.

    def end_of_month
      self.class.new(year, month, -1)
    end

    # Get the first day of the date's year.
    #
    # @return [DateP] DateP object for the first day of the date's year.

    def start_of_year
      self - (yday - 1)
    end

    # Get the last day of the date's year.
    #
    # @return [DateP] DateP object for the last day of the date's year.

    def end_of_year
      self.class.new(year, -1, -1)
    end

    # Find next instance of a given weekday relative to the date
    #
    # @param weekday [String] The day of the week to search for. Must be a weekday _name_, not a number.
    # @return [DateP] DateP object of the found date
    # @raise [InvalidWeekdayError] if passed an invalid weekday argument
    
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
