require 'sinatra'
require_relative './lib/calc'

set :static, true

helpers do
	def data
		@data ||= JSON.parse(File.read(File.join(File.dirname(__FILE__), 'data.json')))
	end

	def money(number)
		num = number.to_s.reverse.chars.each_slice(3).map(&:join).join(',').reverse
		"$#{num}"
	end
end

get '/' do
	erb :home
end

get '/1' do
	erb :array_check
end

get '/1/reveal' do
	calc = Calc.new

	@same_size = calc.arrays_same_length?(
		data.fetch("Benedict Cumberbatch").to_a,
		data.fetch("X-Men").to_a
	)
	@reveal = true

	erb :array_check
end

get '/2' do
	erb :best_average
end

get '/2/reveal' do
	calc = Calc.new

	@averages = data.map do |key, movie_hash|
		avg = calc.avg(movie_hash.values).round
		[key, avg]
	end.to_h
	@reveal = true

	erb :best_average
end

get '/3' do
	erb :best_median
end

get '/3/reveal' do
	calc = Calc.new

	@medians = data.map do |key, movie_hash|
		median = calc.median(movie_hash.values)
		[key, median]
	end.to_h
	@reveal = true

	erb :best_median
end

get '/4' do
	data

	erb :show_all_data
end

get '/5' do
	erb :valid_upcs
end

get '/5/reveal' do
	calc = Calc.new

	all_movies = data.fetch('Benedict Cumberbatch').merge(data.fetch("X-Men"))

	@valid_upc_array = all_movies.map do |title, number|
		valid = calc.valid_upc_check_digit_gtin8?(
			number.to_s[0..7].rjust(8, '0').chars.map(&:to_i)
		)

		{
			title: title,
			number: number,
			valid: valid
		}
	end
	@reveal = true

	erb :valid_upcs
end