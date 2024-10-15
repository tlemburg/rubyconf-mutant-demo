# frozen_string_literal: true

class Calc 
  def add(x,y)
    x+y
  end

	def get(hash, key)
		hash[key]
	end

  def correct_addition?(x,y,z)
		(x + y).equal?(z)
	end

	def strings_equal?(x, y)
		x.eql?(y)
	end

	def valid_upc_check_digit_gtin8?(array)
		odds = [0,2,4,6].map do |i|
			array.fetch(i)
		end.inject(&:+)

		evens = array[1] + array.fetch(3) + array.fetch(5)

		((odds * 3 + evens) % 10).equal? array.fetch(7)
	end

	def untested_method
		'hello_untested'
	end
end
