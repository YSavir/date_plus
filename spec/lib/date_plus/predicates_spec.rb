require 'spec_helper'

RSpec.describe DateP do
  describe '#ce?' do
    it 'should be true if the date is Common Era' do
      date = DateP.new 1, 1, 1

      expect(date.ce?).to be true
    end

    it 'should be false if the date is not Common Era' do
      date = DateP.new -1, 12, 31

      expect(date.ce?).to be false
    end
  end

  describe '#bce?' do
    it 'should be true if the date is Before Comman Era' do
      date = DateP.new -1, 12, 31

      expect(date.bce?).to be true
    end

    it 'should be false when the date is not Before Common Era' do
      date = DateP.new 1, 1, 1

      expect(date.bce?).to be false
    end
  end

end
