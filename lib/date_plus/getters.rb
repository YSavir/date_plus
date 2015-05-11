class DateP

  module Getters

    def weekday_name
      strftime('%A')
    end

    def month_name
      strftime('%B')
    end
  end

end
