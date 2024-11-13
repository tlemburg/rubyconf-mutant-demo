# frozen_string_literal: true

class Calc 
  def arrays_same_length?(array1, array2)
    array1.length == array2.length
  end

  def avg(array)
    sum = 0
    array.each do |val|
      puts sum
      sum += val
    end
    sum / array.length.to_f
  end

  def median(array)
    array.sort[array.length / 2]
  end

	def valid_upc_check_digit_gtin8?(array)
		odds = [0,2,4,6].map do |i|
			array.fetch(i)
		end.inject(&:+)

		evens = array.fetch(1) + array.fetch(3) + array.fetch(5)

		((odds * 3 + evens) % 10).equal? array.fetch(7)
	end
end
