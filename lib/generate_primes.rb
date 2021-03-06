#!/usr/bin/env ruby

class GeneratePrimes

	def initialize(num = 10)
		@n_primes = num
	end

	# Basic method - not efficient as divides every odd no. by every odd no. below it?

	def primes
		# primes = []
		# primes << 2
		primes = [2] # combined previous two lines
		x = 3

		loop do
			break if primes.length == @n_primes # End loop when desired number has been calculated
		# while primes.length < @n_primes # Alternative 1 to loop do, break
		# until primes.length == @n_primes # Alternative 2 to loop do, break
			y = 3
			y += 2 until x % y == 0 # Loop to test if x is divisible by any odd number below it, y
			primes << x if x == y # If the (odd) number was not divisible by any (odd) below itself, it is a prime
			x += 2
		end

		return primes
	end

	# Uses O'Niell's method of implementing the Sieve of Eratosthenes to produce
	# first n primes. See http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf and
	# http://programmingpraxis.com/2011/10/14/the-first-n-primes/

	# def primes
	# 	primes = []
	# 	@priority_queue = []

	# 	def check_pq(x)
	# 		@priority_queue.include? x
	# 	end
		
	# 	def pq_index(x)
	# 		@priority_queue.index(x)
	# 	end

	# 	def pq_replace(x)
	# 		@priority_queue[pq_index(x)] = x + @priority_queue[pq_index(x)+1]
	# 	end

	# 	primes << 2
	# 	x = 3
		
	# 	loop do
	# 		break if primes.length == @n_primes
	# 		check_pq(x) ? (pq_replace(x) while check_pq(x)) : primes << x
	# 		@priority_queue << x**2 << 2*x
	# 		x += 2
	# 	end

	# 	return primes
	# end

end
