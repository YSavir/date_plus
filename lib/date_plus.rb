require_relative "date_plus/version"
require 'date'

class DateP < Date

  def next_week
    self + 7
  end

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
    DateP.new(year, month, -1)
  end

  def end_of_year
    DateP.new(year, -1, -1)
  end

  # options can accept any method that responds to date
  # so long as the criteria matches the output of that method
  def next_instance_of(options)
    options.each { |k, v| options[k] = v.downcase.capitalize if v.class == String }
    return check_dates_by_year(self, end_of_year, options)
  end

  def find_next_weekday(weekday)
    self.step(next_week).reverse_each {|date| return date if date.cwday == weekday}
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
    self.step(self + (7 * instances_away), 1).reverse_each do |current_day|
      return current_day if current_day.weekday_name == weekday.downcase.capitalize
    end
  end

  def future_instance_of_day(day, instances_away=1)
    raise_error_unless_in_num_range(1, month.end_of_month.day, day)
    raise_error_unless_fixnum_or_nil(instances_away)

    self.step(self + (31 * instances_away), 1).reverse_each do |current_day|
      return current_day if current_day.day === day
    end
  end

  def future_instance_of_month(month_name, instances_away=1)
    raise_error_unless_valid_month(month_name)
    raise_error_unless_fixnum_or_nil(instances_away)
    months = []
    first_of_month = Date.today.start_of_month
    (instances_away * 12).times do
      months.push(first_of_month)
      first_of_month = first_of_month.next_month
    end
    months.reverse.each {|first_of_month| return first_of_month if first_of_month.month == Date.parse(month_name).month }
  end

  def future_year(instances_away)
    raise_error_unless_fixnum(instances_away)
    year = Date.today.start_of_year
    years = []
    (instances_away + 1).times {years.push(year); year = year.next_year}
    return years.last
  end

  private

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

  def raise_error_unless_valid_weekday(arg)
    raise 'Argument passed must be a weekday' unless arg.class == String || !arg_names.include?(arg.downcase.capitalize)
  end

  def raise_error_unless_fixnum(arg)
    raise 'Argument passed must be an integer' unless arg.class == Fixnum
  end

  # def raise_error_unless_in_num_range(min, max, num)
  #   raise "Argument passed is not valid number" unless arg.class == Fixnum && (min..max).include? num
  # end

  def raise_error_unless_fixnum_or_nil(arg)
    raise 'Argument passed must be an integer' unless arg.class == Fixnum || arg.nil?
  end

  def raise_error_unless_valid_month(arg)
    raise 'Argument passed is must be a valid month' unless arg.class == String && month_names.include?(arg.downcase.capitalize)
  end

  def raise_error_unless_valid_month_name_or_number(arg)
    raise_error_unless_valid_month
    raise_error_unless_in_num_range(1, 12, arg)
  end

end