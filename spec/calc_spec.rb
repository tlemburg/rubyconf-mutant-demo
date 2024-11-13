# frozen_string_literal: true

require_relative '../lib/calc'

describe Calc do
  describe '#arrays_same_length?' do
    it 'returns true when the arrays are the same length' do
      expect(Calc.new.arrays_same_length?(['a', 'b', 'c'], [1,2,3])).to be true
    end
  end

  describe '#avg' do
    it 'averages an array of numbers' do
      expect(Calc.new.avg([1,2,3,4,5])).to eq 3
    end
  end

  describe '#median' do
    it 'finds the median in an array' do
      expect(Calc.new.median([1,2,3,4,5])).to eq 3
    end
  end

  describe '#valid_upc_check_digit_gtin8?' do
		it 'returns true on a basic valid checksum' do
			arr = [0,1,0,1,0,1,0,3]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns true on a basic valid checksum 2' do
			arr = [5,1,5,1,5,1,7,9]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns false on an invalid checksum' do
			arr = [5,1,5,1,5,1,7,8]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be false
		end
	end
end
