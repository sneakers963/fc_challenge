#!/usr/bin/env ruby

class CreateProdTable

	def initialize(array_1d)
		@primes = array_1d
	end

	def prod_table_row(i)
		row = []
		(row << @primes[i-1] << @primes.map { |p| p * @primes[i-1] }).flatten
	end

	def prod_table
		@n_primes = @primes.length
		pt = Array.new(@n_primes+1) {Array.new(@n_primes+1)}
		pt[0][1..@n_primes] = @primes
		for j in 1..@n_primes
			pt[j] = prod_table_row(j)
		end
		return pt
	end

end
