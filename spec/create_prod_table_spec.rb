#!/usr/bin/env ruby

require 'spec_helper' # randomises test order
require 'create_prod_table' # default location in ./lib

describe CreateProdTable do
	describe '#prod_table' do
		it 'returns a table of the correct dimensions' do
			create_prod_table = CreateProdTable.new([1])
			create_prod_table.prod_table.length.should == 2
			create_prod_table.prod_table[0].length.should == 2
		end
		it 'populates the top row with the input array' do
			create_prod_table = CreateProdTable.new([1,2,3])
			create_prod_table.prod_table[0].should == [nil,1,2,3]
		end
	end

	describe '#prod_table_row' do
		it 'creates rows with correct length' do
			create_prod_table = CreateProdTable.new([1,2,3])
			create_prod_table.prod_table_row(1).length.should == 4
		end
		it 'uses correct indices and performs correct multiplication' do
			create_prod_table = CreateProdTable.new([0,1,2,3])
			create_prod_table.prod_table_row(3).should == [2,0,2,4,6]
		end
	end

	describe '#prod_table' do
		it 'places rows into table correctly' do
			create_prod_table = CreateProdTable.new([0,1,2,3])
			create_prod_table.prod_table[1].should == [0,0,0,0,0]
		end
	end
end
