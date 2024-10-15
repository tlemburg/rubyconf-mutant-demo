# frozen_string_literal: true

require_relative '../lib/calc'

describe Calc do
  describe '#add' do
    it 'adds two numbers' do
      expect(Calc.new.add(-1,1)).to eq 0
    end
  end

  describe '#get' do
		it 'gets the value out of the hash' do
			expect(Calc.new.get({x: 5, y: 6}, :x)).to eq 5
		end

    it 'returns nil if not found' do
      expect(Calc.new.get({x: 5, y: 6}, :z)).to be nil
    end
	end

	describe '#correct_addition?' do
		it 'returns true when the addition is correct' do
			expect(Calc.new.correct_addition?(7,5,12)).to be true
		end
  end

	describe '#strings_equal?' do
		xit 'returns true when the strings are equal' do
			str1 = 'abc'
			str2 = 'de'
			string = "#{str1}#{str2}"

			expect(Calc.new.strings_equal?(string, 'abcde')).to be true
		end

    xit 'returns false if strings are not equal' do
      expect(Calc.new.strings_equal?('', 'abcde')).to be false
    end

		it 'returns true when the strings are equal 2' do
			expect(Calc.new.strings_equal?(+'abcde', 'abcde')).to be true
		end

    it 'returns false if strings are not equal' do
      expect(Calc.new.strings_equal?('', 'abcde')).to be false
    end

	end

  describe '#valid_upc_check_digit_gtin8?' do
		it 'returns true on a basic valid checksum' do
			arr = [0,1,0,1,0,1,0,3]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end

    it 'returns true on a basic valid checksu2' do
			arr = [5,1,5,1,5,1,7,9]
			expect(Calc.new.valid_upc_check_digit_gtin8?(arr)).to be true
		end
	end
end
