#!/usr/bin/env ruby

require 'spec_helper' # randomises test order
require 'generate_primes' # default location in ./lib
require 'mathn' # Needed to access Prime class from mathn module

describe GeneratePrimes do
	describe '#primes' do
		it 'returns the defined quantity of numbers' do
			generate_prime = GeneratePrimes.new(1)
			generate_prime.primes.length.should == 1
		end
		it 'returns only prime numbers' do
			generate_prime = GeneratePrimes.new(10)
			generate_prime.primes.should == Prime.first(10)
		end
		it 'returns by default 10 numbers' do
			generate_prime = GeneratePrimes.new
			generate_prime.primes.length.should == 10
		end
	end
end
