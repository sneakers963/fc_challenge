#!/usr/bin/env ruby

class GeneratePrimes

	def initialize(num = 10)
		@n_primes = num
	end

	# # Basic method - not efficient as tests every odd number
	# def primes
	# 	primes = []
	# 	x = 2
	# 	loop do
	# 	  if ((x % 2 != 0) || (x == 2)) # Only check odd numbers, and 2
	# 	    y = 2
	# 	    # Loop to test if x is divisible by any number below it, y
	# 	    y += 1 until x % y == 0
	# 	    # If the number was not divisible by any below itself, it is a prime
	# 	    primes << x if x == y
	# 	    # End loop when desired number has been calculated
	# 	    break if primes.length == @n_primes
	# 	  end
	# 	  x += 1
	# 	end
	# 	return primes
	# end

	# Uses O'Niell's method of implementing the Sieve of Eratosthenes to produce
	# first n primes. See http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
	def primes
		primes = []
		@priority_queue = []

		def check_pq(x)
			@priority_queue.include? x
		end
		
		def pq_index(x)
			@priority_queue.index(x)
		end

		def pq_replace(x)
			@priority_queue[pq_index(x)] = x + @priority_queue[pq_index(x)+1]
		end

		primes << 2
		x = 3
		
		loop do
			break if primes.length == @n_primes
			check_pq(x) ? (pq_replace(x) while check_pq(x)) : primes << x
			@priority_queue << x**2 << 2*x
			x += 2
		end
		return primes
	end

end
