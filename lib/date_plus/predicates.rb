class DateP
  module Predicates
    
    # Checks if the date is Comman Era
    #
    # @return [Boolean] true if the date is CE
    
    def ce?
      year >= 0
    end

    # Checks if the date is Before Common Era
    #
    # @return [Boolean] true if the date is BCE
    
    def bce?
      year < 0
    end

  end
end
