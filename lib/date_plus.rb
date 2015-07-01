# Core Class
#
class DateP < Date


  # Check if first argument is a date.
  # If it is, instantiate a new DateP with that date's date. Otherwise  will
  # run new as usual
  #
  # @param [Fixnum] year    Year
  # @param [Fixnum] month   Month
  # @param [Fixnum] day     Day
  # @param [Fixnum] start   Start
  # @return [DateP] DateP object

  def self.new(year=-4712, month=1, day=1, start=Date::ITALY)
    if year.class == Date
      date = year
      return self.new date.year, date.month, date.day, date.start
    else
      super
    end
  end

  private

  # List of all weekday names.
  # @todo allow both strings and symbols
  
  WEEKDAY_NAMES = %w{monday tuesday wednesday thursday friday saturday sunday}

end

require 'date_plus/queries'
require 'date_plus/getters'
require 'date_plus/exceptions'

class DateP
  include Getters
  include Queries
end
