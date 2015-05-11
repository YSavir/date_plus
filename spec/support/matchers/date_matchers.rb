RSpec::Matchers.define :have_month do |expected|
  match do |actual|
    actual.month == expected
  end

  failure_message do |actual|
    "Expected month to be #{expected} but got #{actual.month} instead"
  end
end

RSpec::Matchers.define :have_day do |expected|
  match do |actual|
    actual.day == expected
  end

  failure_message do |actual|
    "Expected day to be #{expected} but got #{actual.day} instead"
  end
end

RSpec::Matchers.define :have_year do |expected|
  match do |actual|
    actual.year == expected
  end

  failure_message do |actual|
    "Expected year to be #{expected} but got #{actual.year} instead"
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
