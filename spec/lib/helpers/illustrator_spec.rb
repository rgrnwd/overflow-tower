require 'helpers/illustrator.rb'
require 'models/glass.rb'

describe 'Illustrator' do
  let(:output) { StringIO.new }
  describe '#print_glass' do
    let(:illustrator) { Illustrator.new(output: output) }

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
end
