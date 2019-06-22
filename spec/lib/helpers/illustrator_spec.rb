require 'helpers/illustrator.rb'
require 'models/glass.rb'
require 'models/stack.rb'

describe 'Illustrator' do
  let(:output) { StringIO.new }
  let(:illustrator) { Illustrator.new(output: output) }
  describe '#print_glass' do
    it 'prints an empty glass' do
        glass = Glass.new(250)
        illustrator.print_glass(glass)
        expect(output.string).to eq("|_|")
    end

    it 'prints a full glass' do
        glass = Glass.new(250)
        glass.pour(250)
        illustrator.print_glass(glass)
        expect(output.string).to eq("|█|")
    end
    it 'prints a partially full glass' do
        glass = Glass.new(250)
        glass.pour(100)
        illustrator.print_glass(glass)
        expect(output.string).to eq("|▄|")
    end
  end

  describe '#print_stack' do
    it 'prints a stack of one row' do
        stack = Stack.new(1)
        illustrator.print_stack(stack)
        expect(output.string).to eq("|_|\n")
    end

    it 'prints a stack of two rows' do
        stack = Stack.new(2)
        illustrator.print_stack(stack)
        expect(output.string).to eq("|_|\n|_||_|\n")
    end

    it 'prints a partially full stack of glasses' do
        stack = Stack.new(3)
        stack.pour(300)
        illustrator.print_stack(stack)
        expect(output.string).to eq("|█|\n|▄||▄|\n|_||_||_|\n")
    end
  end
end
