require 'helpers/console_interface.rb'

describe 'console interface' do
  let(:output) { StringIO.new }
  describe '#build_glass_tower_from_input' do
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
      it 'prints a summary with default values' do
        console_interface = ConsoleInterface.new(output: output, input: StringIO.new("INVALID\nNaN\n"))
        console_interface.build_glass_tower_from_input
        expect(output.string).to include("Capacity is 250, and the tower is 5 levels high")
      end
    end
  end

  describe '#pour_water_onto_tower' do
    let(:console_interface) { ConsoleInterface.new(output: output, input: StringIO.new("100\n")) }
    let(:glass_tower) { instance_double('Stack') }

    it 'pours the specified amount onto the glass tower' do
      expect(glass_tower).to receive(:pour).with(100.0)

      console_interface.pour_water_onto_tower(glass_tower)
    end
    it 'prints a summary' do
      allow(glass_tower).to receive(:pour)

      console_interface.pour_water_onto_tower(glass_tower)
      expect(output.string).to include("Okay, we've just poured 100mls onto the tower.")
    end
  end
end
