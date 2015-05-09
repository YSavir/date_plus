require 'date'
require_relative "date_plus/converters"
require_relative "date_plus/version"
require_relative "date_plus/exceptions"

class DateP < Date
  include Converters

  WEEKDAY_NAMES = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']


  # Check if first argument is a date.
  # If it is, instantiate a new DateP with that date's date
  # else run new as usual
  def self.new(year=-4712, month=1, day=1, start=Date::ITALY)
    if year.class == Date
      date = year
      return self.new(date.year, date.month, date.day, date.start)
    else
      super
    end
  end

  # options can accept any method that responds to date
  # so long as the criteria matches the output of that method
  def next_instance_of(options)
    options.each { |k, v| options[k] = v.downcase.capitalize if v.class == String }
    return check_dates_by_year(self, end_of_year, options)
  end

  def find_next_weekday(weekday)
    self.step(next_week).reverse_each {|date| return date if date.weekday_name == weekday}
  end

  def find_next_day(day)
    self.step(next_month).reverse_each {|date| return date if date.day == day}
  end

  def find_next_month(target_month)
    raise_error_unless_valid_month(target_month)
    month_to_check = next_month.start_of_month
    until target_month == month_to_check.month || target_month.downcase.capitalize == month_to_check.month_name
      month_to_check = month_to_check.next_month
    end
    month_to_check
  end

  def future_instance_of_weekday(weekday, instances_away=1)
    raise_error_unless_valid_weekday
    raise_error_unless_fixnum_or_nil(instances_away)

    potential_weekdays = potential_days(instances_away).map do |potential_day|
      potential_day.weekday_name
    end

    potential_weekdays.find do |potential_day|
      potential_day.weekday_name == weekday_name.downcase.capitalize
    end
  end

  def future_instance_of_day(day, instances_away=1)
    # raise_error_unless_in_num_range(1, end_of_month.day, day)
    # raise_error_unless_fixnum_or_nil(instances_away)

    potential_days(instances_away).find do |possible_day|
      possible_day.day === day
    end
  end

  def future_instance_of_month(month_name, instances_away=1)
    raise_error_unless_valid_month(month_name)
    raise_error_unless_fixnum_or_nil(instances_away)

    potential_months = [next_month.start_of_month]
    (instances_away * 12 - 1).times do
      potential_months.push(potential_months.last.next_month)
    end
    potential_months.reverse.find do |potential_month|
      potential_month.month == month_name_to_number(month_name)
    end
  end

  def future_year(instances_away)
    raise_error_unless_fixnum(instances_away)
    year = start_of_year
    (instances_away + 1).times { year = year.next_year }
    return year
  end

  protected

  def valid_condition(field, condition)
    self.send(field) == condition
  end

  private

  def potential_days(instances_away)
    step(self + (31 * instances_away), 1).to_a.reverse
  end

  def month_name_to_number(month_name)
    MONTH_NAMES.index(month_name) + 1
  end

  def matches_value(field, value)
    self.send(field) == value
  end

  def check_dates_by_year(start_date, end_date, options)
    start_date.step(end_date, step=+1) do |date|
      return date if options.all? { |k, v| date.valid_condition(k, v) }
    end
    next_year_start = end_date + 1
    check_dates_by_year(next_year_start, next_year_start.end_of_year, options)
  end

end

