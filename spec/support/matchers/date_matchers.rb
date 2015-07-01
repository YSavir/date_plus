RSpec::Matchers.define :have_date do |year, month, day|
  match do |actual|
    actual.year == year && actual.month == month && actual.day == day
  end

  failure_message do |actual|
    "Expected a date of #{month}/#{day}/#{year} but got #{actual.strftime("%m/%d/%y")} instead."
  end
end

RSpec::Matchers.define :be_new_years_day_2015 do
 match do |actual|
   actual.day == 1 && actual.month == 1 && actual.year == 2015
 end

 failure_message do |actual|
   "Expected #{actual} to be New Year's Day 2015, but it isn't."
 end
end

RSpec::Matchers.define :have_weekday_name do |expected|
  match do |actual|
    actual.weekday_name == expected
  end

  failure_message do |actual|
    "Expected #{actual}'s weekday name to be #{expected} but got #{actual.weekday_name} instead"
  end
end

RSpec::Matchers.define :have_month_name do |expected|
  match do |actual|
    actual.month_name == expected
  end

  failure_message do |actual|
    "Expected #{actual}'s month name to be #{expected} but got #{actual.month_name} instead"
  end
end
