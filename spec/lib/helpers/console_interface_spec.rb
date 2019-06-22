require 'helpers/console_interface.rb'

describe 'console interface' do
  describe '#build_glass_tower_from_input' do
    let(:output) { StringIO.new }

    describe 'default input' do
      let(:input) { StringIO.new("\n\n") }
      let(:console_interface) { ConsoleInterface.new(output: output, input: input) }

      it 'returns a glass tower with five levels and capacity 250ml' do
        glass_tower = console_interface.build_glass_tower_from_input
        expect(glass_tower.rows.length).to eq(5)
        expect(glass_tower.rows[0][0].check_capacity).to eq(250)
      end
      it 'prints a summary with default values' do
        console_interface.build_glass_tower_from_input
        expect(output.string).to include("Capacity is 250, and the tower is 5 levels high")
      end
    end
    describe 'custom input' do
      let(:input) { StringIO.new("300\n4\n") }
      let(:console_interface) { ConsoleInterface.new(output: output, input: input) }

      it 'returns a glass tower with four levels' do
        glass_tower = console_interface.build_glass_tower_from_input
        expect(glass_tower.rows.length).to eq(4)
        expect(glass_tower.rows[0][0].check_capacity).to eq(300)
      end

      it 'prints a summary of the user input' do
          console_interface.build_glass_tower_from_input
          expect(output.string).to include("Capacity is 300, and the tower is 4 levels high")
      end
    end
    describe 'invalid input' do
      let(:input) { StringIO.new("INVALID\nNaN\n") }
      let(:console_interface) { ConsoleInterface.new(output: output, input: input) }
      it 'prints a summary with default values' do
        console_interface.build_glass_tower_from_input
        expect(output.string).to include("Capacity is 250, and the tower is 5 levels high")
      end
    end
  end
end
