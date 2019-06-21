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
  end
end  