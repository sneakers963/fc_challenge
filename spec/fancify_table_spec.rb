#!/usr/bin/env ruby

require 'spec_helper' # randomises test order
require 'fancify_table' # default location in ./lib

def ft
	FancifyTable.new([[1,2],[3,4]])
end

describe FancifyTable do
	describe '#column_dims' do
		it 'defines column widths dependent on contents' do
			fancy_table = FancifyTable.new([['111','11'],['1','11111']])
			fancy_table.column_dims.should == [3,5]
		end
		it 'defines column widths for integer entries' do
			fancy_table = FancifyTable.new([[111,11],[1,11111]])
			fancy_table.column_dims.should == [3,5]
		end
	end

	describe '#display_table_row' do
		it 'outputs correctly formatted row to the prompt' do
			$stdout.should_receive(:puts).with('3 | 4')
			fancy_table = ft
			fancy_table_output = fancy_table.display_table_row(1)
		end
	end

	describe '#table_width' do
		it 'calculate the complete width of the table' do
			fancy_table = ft
			fancy_table.table_width.should == 5
		end
	end

	describe '#display_table' do
		it 'displays everything correctly' do
			$stdout.should_receive(:puts).with('1 | 2')
			$stdout.should_receive(:puts).with('-----')
			$stdout.should_receive(:puts).with('3 | 4')
			fancy_table = ft
			fancy_table.display_table
		end
	end

end
