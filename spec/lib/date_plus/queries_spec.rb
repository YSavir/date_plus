require 'spec_helper'

RSpec.describe DateP do
  before(:all) { @new_years_2015 = DateP.new(2015, 1, 1) }
 
  describe '#next_week' do
    it 'should return the same week day of the next week' do
      date = DateP.new 2014, 12, 18
      next_week = date.next_week
      
      expect(next_week).to have_date 2014, 12, 25
      expect(next_week.next_week).to eql @new_years_2015
    end
  end

  describe '#find_next_weekday' do
    
    describe 'When given a valid weekday' do
      it 'should return the next day of that name' do
        date = DateP.new 2014, 12, 28
        next_monday = date.find_next_weekday 'monday'
        next_thursday = date.find_next_weekday 'Thursday'

        expect(next_monday).to have_date 2014, 12, 29
        expect(next_thursday).to eql @new_years_2015
      end
    end

    describe 'When given an invalid weekday' do
      it 'should raise an error' do
        date = DateP.new 2014, 12, 28

        expect { date.find_next_weekday 'Foo' }.to raise_error DateP::InvalidWeekdayError
      end
    end
  end


  describe '#start_of_week' do
    it 'should return the previous Sunday' do
      date = DateP.new 2014, 12, 23

      expect(date.start_of_week).to eql DateP.new 2014, 12, 21
      expect(@new_years_2015.start_of_week).to eql DateP.new 2014, 12, 28
    end

    describe 'if told to use Monday as the first day of the week' do
      it 'should return the previous Monday'do
        date = DateP.new 2014, 12, 23

        expect(date.start_of_week(:monday => true)).to eql DateP.new 2014, 12, 22
        expect(@new_years_2015.start_of_week(:monday => true)).to eql DateP.new 2014, 12, 29
      end
    end
  end

  describe '#end_of_week' do
    it 'should return the next Saturday' do
      date = DateP.new 2014, 12, 23

      expect(date.end_of_week).to eql DateP.new 2014, 12, 27
      expect(@new_years_2015.end_of_week).to eql DateP.new 2015, 1, 3
    end

    describe 'if told to use Monday as the first day of the week' do
      it 'should return the next Sunday' do
        date = DateP.new 2014, 12, 23

        expect(date.end_of_week(:monday => true)).to eql DateP.new 2014, 12, 28
        expect(@new_years_2015.end_of_week(:monday => true)).to eql DateP.new 2015, 1, 4
      end
    end
  end

  describe '#start_of_month' do
    it 'should return the first of the month' do
      dec_date = DateP.new 2014, 12, 28
      jan_date = DateP.new 2015, 1, 10

      expect(dec_date.start_of_month).to eql DateP.new 2014, 12, 1
      expect(jan_date.start_of_month).to eql @new_years_2015
    end
  end

  describe '#end_of_month' do
    it 'should return the last day of the month' do
      dec_date = DateP.new 2014, 12, 28

      expect(dec_date.end_of_month).to eql DateP.new 2014, 12, 31
      expect(@new_years_2015.end_of_month).to eql DateP.new 2015, 1, 31
    end
  end

  describe '#start_of_year' do
    it 'should return Jan 1st of the date\'s year' do
      date_for_2014 = DateP.new 2014, 12, 28
      date_for_2015 = DateP.new 2015, 1, 10
 
      expect(date_for_2014.start_of_year).to eql DateP.new 2014, 1, 1
      expect(date_for_2015.start_of_year).to eql @new_years_2015
    end
  end

  describe '#end_of_year' do
    it 'should return Dec 31st for the date\'s year' do
      date_for_2014 = DateP.new 2014, 1, 10

      expect(date_for_2014.end_of_year).to eql DateP.new 2014, 12, 31
      expect(@new_years_2015.end_of_year).to eql DateP.new 2015, 12, 31
    end
  end

  describe '#previous_year' do
    it 'should return the same date of the previous year' do
      date_for_2014 = DateP.new 2014, 1, 10
      previous_year = date_for_2014.previous_year
      
      expect(previous_year).to eql DateP.new 2013, 1, 10
      expect(previous_year.previous_year).to eql DateP.new 2012, 1, 10
    end
  end

end
