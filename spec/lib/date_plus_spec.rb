require 'pry'
require_relative '../spec_helper'

describe DateP do
  it 'should inherit from Date' do
    expect(DateP.ancestors).to include Date
  end

  describe '::new' do  
    
    it 'should accept a date object' do
      expect { DateP.new(Date.new) }.not_to raise_error
    end

    describe 'When receiving date details' do
      let! (:date) { DateP.new(2015, 3, 7, Date::ITALY) }
      subject { date }

      it { is_expected.to be_instance_of DateP }
      it { is_expected.to have_date 2015, 3, 7 }
    end

    describe 'When receiving a Date object' do
      let! (:date) { DateP.new(Date.new(2015, 3, 7, Date::ITALY)) }
      subject { date }

      it { is_expected.to be_instance_of DateP }
      it { is_expected.to have_date 2015, 3, 7 }
    end
  end
end