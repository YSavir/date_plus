require_relative "date_plus/version"
require 'date'

class Date

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
    Date.civil(year, month, -1)
  end

  def end_of_year
    Date.civil(year, -1, -1)
  end

  # options can accept any method that responds to date
  # so long as the criteria matches the output of that method
  def next_instance_of(options)
    options.each { |k, v| options[k] = v.downcase.capitalize if v.class == String }
    return check_dates_by_year(self, end_of_year, options)
  end

  def future_instance_of_weekday(weekday, instances_away=1)
    raise 'Argument passed is not a weekday' unless weekday.class == String || !weekday_names.include?(weekday.downcase.capitalize)
    fixnum_or_nil_or_error(instances_away)
    self.step(self + (7 * instances_away), step=+1).reverse_each do |current_day|
      return current_day if current_day.weekday_name == weekday.downcase.capitalize
    end
  end

  def future_instance_of_day(day, instances_away=1)
    valid_day_or_error(day)
    fixnum_or_nil_or_error(instances_away)
    self.step(self + (31 * instances_away), step=+1).reverse_each do |current_day|
      return current_day if current_day.day === day
    end
  end

  def future_instance_of_month(month_name, instances_away=1)
    valid_month_or_error(month_name)
    fixnum_or_nil_or_error(instances_away)
    months = []
    first_of_month = Date.today.start_of_month
    (instances_away * 12).times do
      months.push(first_of_month)
      first_of_month = first_of_month.next_month
    end
    months.reverse.each {|first_of_month| return first_of_month if first_of_month.month == Date.parse(month_name).month }
  end

  def future_year(instances_away)
    fixnum_nil_or_error(instances_away)
    year = Date.today.start_of_year
    years = []
    (instances_away + 1).times {years.push(year); year = year.next_year}
    return years.last
  end

  def increment
    @times_incremented ? @times_incremented += 1 : @times_incremented = 1
    self.adjusted_day
  end

  def adjusted_day
    self + times_incremented
  end

  private

  def times_incremented
    @times_incremented
  end

  def weekday_names
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

  def month_names
    ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  end

  def matches_value(field, value)
    self.send(field) == value
  end

  def valid_condition(field, condition)
    self.send(field) == condition
  end

  def check_dates_by_year(start_date, end_date, options)
    start_date.step(end_date, step=+1) do |date|
      return date if options.all? { |k, v| date.valid_condition(k, v) }
    end
    next_year_start = end_date + 1
    check_dates_by_year(next_year_start, next_year_start.end_of_year, options)
  end

  def fixnum_or_nil_or_error(arg)
    raise 'Argument passed is not an integer' unless arg.class == Fixnum || arg.nil?
  end

  def valid_day_or_error(arg)
    raise 'Argument passed is not a valid day' unless arg.class == Fixnum && 0 < arg && arg < 32
  end

  def valid_month_or_error(arg)
    raise 'Argument passed is not a valid month' unless arg.class == String && month_names.include?(arg.downcase.capitalize)
  end

end