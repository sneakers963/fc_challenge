#!/usr/bin/env ruby

require './lib/generate_primes'
require './lib/create_prod_table'
require './lib/fancify_table'

# Added functionality for command line control of number of primes
arg = ARGV[0]
if arg == nil
	primes = GeneratePrimes.new.primes
else
	primes = GeneratePrimes.new(arg.to_i).primes
end

pt = CreateProdTable.new(primes).prod_table
FancifyTable.new(pt).display_table


# require 'benchmark'

# time = Benchmark.realtime do
# 	100.times {GeneratePrimes.new.primes}
# end

# puts "#{time}"