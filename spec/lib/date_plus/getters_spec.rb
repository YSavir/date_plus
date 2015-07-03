require 'spec_helper'

RSpec.describe DateP do

  describe '#weekday_name' do

    it 'should return the plain language name of the weekday' do
      date = DateP.new 2015, 1, 1
      next_date = date.next_day

      expect(date).to have_weekday_name 'Thursday'
      expect(next_date).to have_weekday_name 'Friday'
    end
  end

  describe '#month_name' do
    it 'should return the plain language name of the month' do
      jan = DateP.new 2015, 1, 1
      feb = DateP.new 2015, 2, 1

      expect(jan).to have_month_name 'January'
      expect(feb).to have_month_name 'February'
    end
  end
end
