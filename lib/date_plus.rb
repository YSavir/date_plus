class DateP < Date

  WEEKDAY_NAMES = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']

  # Check if first argument is a date.
  # If it is, instantiate a new DateP with that date's date
  # else run new as usual
  def self.new(year=-4712, month=1, day=1, start=Date::ITALY)
    if year.class == Date
      date = year
      return self.new date.year, date.month, date.day, date.start
    else
      super
    end
  end
end

require 'date_plus/queries'
require 'date_plus/getters'
require 'date_plus/exceptions'

class DateP
  include Getters
  include Queries
end
