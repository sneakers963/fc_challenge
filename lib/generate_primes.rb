#!/usr/bin/env ruby

class GeneratePrimes

	def initialize(num = 10)
		@n_primes = num
	end

	def primes
		primes = []
		# This is not very efficient as it tests every odd number...?
		x = 2
		loop do
		  if ((x % 2 != 0) || (x == 2)) # Only check odd numbers, and 2
		    y = 2
		    # Loop to test if x is divisible by any number below it, y
		    y += 1 until x % y == 0
		    # If the number was not divisible by any below itself, it is a prime
		    primes << x if x == y
		    # End loop when desired number has been calculated
		    break if primes.length == @n_primes
		  end
		  x += 1
		end
		return primes
	end

end
