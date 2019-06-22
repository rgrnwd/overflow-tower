require 'helpers/console_interface.rb'

describe 'console interface' do
  let(:output) { StringIO.new }
  describe '#build_glass_stack_from_input' do
    describe 'default input' do
      let(:input) { StringIO.new("\n\n") }
      let(:console_interface) { ConsoleInterface.new(output: output, input: input) }

      it 'returns a glass stack with five levels and capacity 250ml' do
        glass_stack = console_interface.build_glass_stack_from_input
        expect(glass_stack.rows.length).to eq(5)
        expect(glass_stack.rows[0][0].check_capacity).to eq(250)
      end
      it 'prints a summary with default values' do
        console_interface.build_glass_stack_from_input
        expect(output.string).to include("Capacity is 250, and the stack is 5 levels high")
      end
    end
    describe 'custom input' do
      let(:input) { StringIO.new("300\n4\n") }
      let(:console_interface) { ConsoleInterface.new(output: output, input: input) }

      it 'returns a glass stack with four levels' do
        glass_stack = console_interface.build_glass_stack_from_input
        expect(glass_stack.rows.length).to eq(4)
        expect(glass_stack.rows[0][0].check_capacity).to eq(300)
      end

      it 'prints a summary of the user input' do
          console_interface.build_glass_stack_from_input
          expect(output.string).to include("Capacity is 300, and the stack is 4 levels high")
      end
    end
    describe 'invalid input' do
      it 'prints a summary with default values' do
        console_interface = ConsoleInterface.new(output: output, input: StringIO.new("INVALID\nNaN\n"))
        console_interface.build_glass_stack_from_input

        expect(output.string).to include("Capacity is 250, and the stack is 5 levels high")
      end
    end
    describe 'number of levels too high' do
      it 'creates a stack of the maximum 20 levels' do
        console_interface = ConsoleInterface.new(output: output, input: StringIO.new("250\n200\n"))
        console_interface.build_glass_stack_from_input

        expect(output.string).to include("Capacity is 250, and the stack is 20 levels high")
      end
    end
  end

  describe '#pour_water_onto_stack' do
    let(:glass_stack) { instance_double('Stack') }
    describe 'valid input' do
      let(:console_interface) { ConsoleInterface.new(output: output, input: StringIO.new("100\n")) }

      it 'pours the specified amount onto the glass stack' do
        expect(glass_stack).to receive(:pour).with(100.0)

        console_interface.pour_water_onto_stack(glass_stack)
      end
      it 'prints a summary' do
        allow(glass_stack).to receive(:pour)

        console_interface.pour_water_onto_stack(glass_stack)
        expect(output.string).to include("Okay, we've just poured 100mls onto the stack.")
      end
    end
    describe 'invalid input' do
      it 'pours a default amount onto the glass stack' do
        console_interface = ConsoleInterface.new(output: output, input: StringIO.new("INVALID\n"))
        expect(glass_stack).to receive(:pour).with(1000.0)

        console_interface.pour_water_onto_stack(glass_stack)
      end
    end
    describe 'amount too high' do
      it 'pours the maximum amount of 150L' do
        console_interface = ConsoleInterface.new(output: output, input: StringIO.new("200000\n"))
        expect(glass_stack).to receive(:pour).with(150000.0)
        console_interface.pour_water_onto_stack(glass_stack)
      end
    end
  end

  describe '#display_glass_content' do
    let(:glass_stack) { instance_double('Stack') }

    it 'passes the user input for row and index of glass to find contents' do
      console_interface = ConsoleInterface.new(output: output, input: StringIO.new("1\n1\n"))
      expect(glass_stack).to receive(:check_glass_content).with(1, 1)
      console_interface.display_glass_content(glass_stack)
    end

    it 'displays result returned from glass stack' do
      console_interface = ConsoleInterface.new(output: output, input: StringIO.new("3\n3\n"))
      expect(glass_stack).to receive(:check_glass_content).with(3, 3).and_return(300)
      console_interface.display_glass_content(glass_stack)
      expect(output.string).to include("There seems to be 300mls in that glass")
    end

    it 'returns no such glass when index is out of bounds' do
      console_interface = ConsoleInterface.new(output: output, input: StringIO.new("6\n7\n"))
      expect(glass_stack).to receive(:check_glass_content).with(6, 7).and_return('no such glass')
      console_interface.display_glass_content(glass_stack)
      expect(output.string).to include("There is no glass at row 6 and index 7")
    end

    it 'returns that glass is empty when glass content is 0' do
      console_interface = ConsoleInterface.new(output: output, input: StringIO.new("1\n1\n"))
      expect(glass_stack).to receive(:check_glass_content).with(1, 1).and_return(0)
      console_interface.display_glass_content(glass_stack)
      expect(output.string).to include("That glass is empty")
    end
  end
end
