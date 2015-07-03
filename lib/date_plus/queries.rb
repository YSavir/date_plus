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
    # @param weekday [String, Symbol, Fixnum] The day of the week to search for.  Can use the full day name as a string or symbol, or the corresponding weekday number (1-7)
    # @return [DateP] DateP object of the found date
    # @raise [InvalidWeekdayError] if passed an invalid weekday argument

    def next_cwday(weekday, instances_away=1)
      weekday = weekday.is_a?(Fixnum) ? weekday_from_num(weekday) : weekday.to_s
      raise InvalidWeekdayError unless weekday_names.include? weekday
      farthest_date = self + (7 * instances_away)
      self.step(farthest_date).reverse_each do |date|
        return date if date.weekday_name.downcase == weekday.downcase
      end
      nil
    end

    private

    def weekday_from_num(weekday)
      weekday_names[ weekday - 1 ]
    end

    def weekday_names
      self.class::WEEKDAY_NAMES
    end
  end
end
