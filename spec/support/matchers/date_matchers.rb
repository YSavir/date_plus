RSpec::Matchers.define :have_month do |expected|
  match do |actual|
    actual.month == expected
  end
end

RSpec::Matchers.define :have_day do |expected|
  match do |actual|
    actual.day == expected
  end
end

RSpec::Matchers.define :have_year do |expected|
  match do |actual|
    actual.year == expected
  end
end
