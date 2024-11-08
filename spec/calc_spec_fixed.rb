# frozen_string_literal: true

require_relative '../lib/calc'

describe Calc do
  # Change == to equal?
  describe '#arrays_same_length?' do
    it 'returns true when the arrays are the same length' do
      expect(Calc.new.arrays_same_length?(['a', 'b', 'c'], [1,2,3])).to be true
    end

    it 'returns false when the arrays are not the same length' do
      expect(Calc.new.arrays_same_length?(['a', 'b', 'c'], [0,1,2,3])).to be false
    end
  end

  # Note that mutant does not catch the case of 0-length array
  # Remove the puts
  describe '#avg' do
    it 'averages an array of numbers' do
      expect(Calc.new.avg([1,2,3,4,5])).to eq 3
      expect(Calc.new.avg([1,2,3,4,6])).to eq 3.2
    end
  end

  describe '#median' do
    it 'finds the median in an array' do
      expect(Calc.new.median([1,2,3,4,5])).to eq 3
      expect(Calc.new.median([5,6,7,8,9])).to eq 7
      expect(Calc.new.median([9,8,7,6,5])).to eq 7
      expect(Calc.new.median([9,7,6,8,5])).to eq 7
    end
  end

  # Use fetch for all array access
  describe '#valid_upc_check_digit_gtin8?' do
		it 'returns true on a basic valid checksum' do
			arr = [0,1,0,1,0,1,0,3]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns true on a basic valid checksum 2' do
			arr = [5,1,5,1,5,1,7,9]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns true on a basic valid checksum 3' do
			arr = [5,2,5,3,5,4,7,5]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns false on an invalid checksum' do
      arr = [5,1,5,1,5,0,7,9]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be false
    end
	end
end
