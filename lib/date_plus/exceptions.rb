class DateP

  class InvalidWeekdayError < StandardError
    def to_s
      'Argument passed must be a weekday'
    end
  end

  class InvalidIntegerError < StandardError
    def to_s
      'Argument passed must be an integer'
    end
  end

  class InvalidMonthError < StandardError
    def to_s
      'Argument passed must be a valid month'
    end
  end

  private

  def raise_error_unless_valid_weekday(arg)
    raise InvalidWeekdayError unless arg.class == String && !WEEKDAY_NAMES.include?(arg.downcase.capitalize)
  end

  def raise_error_unless_fixnum(arg)
    raise InvalidIntegerError unless arg.class == Fixnum
  end

  def raise_error_unless_fixnum_or_nil(arg)
    raise InvalidIntegerError unless arg.class == Fixnum || arg.nil?
  end

  def raise_error_unless_valid_month(arg)
    raise InvalidMonthError unless arg.class == String && MONTH_NAMES.include?(arg.downcase.capitalize)
  end

  def raise_error_unless_valid_month_name_or_number(arg)
    raise_error_unless_valid_month
    raise_error_unless_in_num_range(1, 12, arg)
  end

end