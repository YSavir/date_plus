# DatePlus

Additional methods for date objects.

## Installation

Add this line to your application's Gemfile:

    gem 'date_plus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install date_plus

## Usage

Date_plus adds methods directly to instances of Date objects:

```ruby
date_object = Date.new(2014, 7, 24)
# => #<Date: 2014-07-24 ((2456863j,0s,0n),+0s,2299161j)>```

### Methods for weekday and month names

```ruby
date_object.weekday_name
=> "Thursday"

date_object.month_name
=> "July"```

### Find a specific future date
```ruby
date_object.next_instance_of(:month => 12, :day => 5)
# => #<Date: 2014-12-05 ((2456997j,0s,0n),+0s,2299161j)>

date_object.next_instance_of(:month_name => 'July', :day => 4, :weekday_name => 'Sunday')
# => #<Date: 2021-07-04 ((2459400j,0s,0n),+0s,2299161j)>

# next_instance_of accepts any combination of date methods
```

### Start/end of time periods

```ruby
date_object.start_of_week
# => #<Date: 2014-07-20 ((2456859j,0s,0n),+0s,2299161j)>

date_object.end_of_week
# => #<Date: 2014-07-26 ((2456865j,0s,0n),+0s,2299161j)>

date_object.start_of_month
# => #<Date: 2014-07-01 ((2456840j,0s,0n),+0s,2299161j)>

date_object.end_of_month
# => #<Date: 2014-07-31 ((2456870j,0s,0n),+0s,2299161j)>

date_object.start_of_year
# #<Date: 2014-01-01 ((2456659j,0s,0n),+0s,2299161j)>

date_object.end_of_year
# => #<Date: 2014-12-31 ((2457023j,0s,0n),+0s,2299161j)>```

### next or future instance of specific date values

```ruby
date_object.future_instance_of_weekday('sunday')
# => #<Date: 2014-07-27 ((2456866j,0s,0n),+0s,2299161j)>

date_object.future_instance_of_day(21)
# => #<Date: 2014-08-21 ((2456891j,0s,0n),+0s,2299161j)>

date_object.future_instance_of_month('March')
# => #<Date: 2015-03-01 ((2457083j,0s,0n),+0s,2299161j)>

# Each of the above methods my optionally be given a second integer parameter n
# to return the nth instance from the date
date_object.future_instance_of_weekday('sunday', 4)
# => #<Date: 2014-08-17 ((2456887j,0s,0n),+0s,2299161j)>

# a second integer argument will find the nth future weekday
date_object.future_instance_of_weekday('sunday', 4)
# => #<Date: 2014-08-17 ((2456887j,0s,0n),+0s,2299161j)>```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Things to Contribute
* Optimization
* Additional appropriate methods
