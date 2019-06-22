require 'models/stack.rb'

describe 'stack' do
  describe '#initialize' do
    it 'creates a stack of glasses with 1 level' do
      glass_stack = Stack.new(1)
      expect(glass_stack.rows.length).to eq(1)
    end
    it 'creates a stack of glasses with multiple levels' do
      glass_stack = Stack.new(10)
      expect(glass_stack.rows.length).to eq(10)
    end
    it 'creates one glass on the first row' do
      glass_stack = Stack.new(1)
      expect(glass_stack.rows[0].length).to eq(1)
    end
    it 'creates five glasses on the fifth row' do
      glass_stack = Stack.new(5)
      expect(glass_stack.rows[4].length).to eq(5)
    end

    it 'creates glasses with default capacity 250' do
      glass_stack = Stack.new(3)
      expect(glass_stack.rows[0][0].check_capacity).to eq(250)
    end

    it 'creates glasses with custom capacity' do
      glass_stack = Stack.new(3, 500)
      expect(glass_stack.rows[0][0].check_capacity).to eq(500)
    end
  end

  describe '#check_glass_content' do
    it 'returns the content of the glass in the first index of the first row' do
      glass_stack = Stack.new(1)
      expect(glass_stack.check_glass_content(1, 1)).to eq(0)
    end
    it 'returns the content of the glass in the nth index of the nth row' do
      glass_stack = Stack.new(5)
      expect(glass_stack.check_glass_content(3, 2)).to eq(0)
    end
    it 'returns "no such glass" when row given is outside of stack bounds' do
      glass_stack = Stack.new(1)
      expect(glass_stack.check_glass_content(2, 1)).to eq('no such glass')
    end
    it 'returns "no such glass" when index given is outside of row bounds' do
      glass_stack = Stack.new(1)
      expect(glass_stack.check_glass_content(1, 2)).to eq('no such glass')
    end
  end

  describe '#pour' do
    it 'pours amount given into top glass' do
      glass_stack = Stack.new(3)
      glass_stack.pour(250)
      expect(glass_stack.check_glass_content(1, 1)).to eq(250)
    end

    it 'pours overflow to next row' do
      glass_stack = Stack.new(3)
      glass_stack.pour(350)
      expect(glass_stack.check_glass_content(2, 1)).to eq(50)
      expect(glass_stack.check_glass_content(2, 2)).to eq(50)
    end

    it 'pours overflow multiple rows' do
      glass_stack = Stack.new(3)
      glass_stack.pour(1000.0)
      expect(glass_stack.check_glass_content(1, 1)).to eq(250)
      expect(glass_stack.check_glass_content(2, 1)).to eq(250)
      expect(glass_stack.check_glass_content(2, 2)).to eq(250)
      expect(glass_stack.check_glass_content(3, 1)).to eq(62.5)
      expect(glass_stack.check_glass_content(3, 2)).to eq(125)
      expect(glass_stack.check_glass_content(3, 3)).to eq(62.5)
    end
    it 'stops pouring when all glasses are full' do
      glass_stack = Stack.new(3, 100)
      glass_stack.pour(1000)
    end
  end
end