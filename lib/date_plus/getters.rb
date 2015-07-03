class DateP

  # Methods for fetching data about the date

  module Getters

    # Get the weekday name of the date
    #
    # @return [String] weekday name
    
    def weekday_name
      strftime('%A')
    end
    
    # Get the month name of the date
    #
    # @return [String] month name

    def month_name
      strftime('%B')
    end
  end

end
