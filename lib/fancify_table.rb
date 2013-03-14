#!/usr/bin/env ruby

class FancifyTable

	def initialize(array_2d)
		@array_2d = array_2d
		@n_rows = array_2d.length
	end

	def column_dims
		@array_2d.transpose.map { |col| col.map { |i| i.to_s.length }.max }
	end

	def display_table_row(row)
		puts @array_2d[row].zip(column_dims).map { |i, w| i.to_s.ljust(w) }.join(' | ')
	end

	def table_width
		3 * (column_dims.length - 1) + column_dims.reduce(:+) 
	end

	def display_table
		for row in 0...@n_rows
			display_table_row(row)
			puts "-" * table_width if row == 0
		end
	end

end
