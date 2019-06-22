require "./lib/models/stack.rb"

class ConsoleInterface
    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end
    
    def build_glass_stack_from_input
        @output.print 'Each glass has a capacity of? (specify number or press enter for default 250ml) '
        capacity = @input.gets.chomp.to_i
        capacity = 250 if capacity == 0
        
        @output.print 'How tall is this stack of glasses? (specify number or press enter for default 5) '
        levels = @input.gets.chomp.to_i
        levels = 5 if levels == 0
        
        @output.puts "Capacity is #{capacity}, and the stack is #{levels} levels high!"
        glass_stack = Stack.new(levels.to_i, capacity.to_i)
    end

    def pour_water_onto_stack(glass_stack)
        @output.print "Let's pour some water onto the stack, shall we? "\
            "(Enter amount in mls or press enter for default 1000mls) "
        amount = @input.gets.chomp.to_f
        amount = 1000.0 if amount == 0

        glass_stack.pour(amount)
        @output.puts "Okay, we've just poured #{amount.to_i}mls onto the stack."
    end

    def display_glass_content(glass_stack)
        @output.print "Let's check how much water is in the glass at row (first row is 1): "
        row = @input.gets.chomp
        @output.print "and index (first glass in the row is 1): "
        index = @input.gets.chomp
        result = glass_stack.check_glass_content(row.to_i, index.to_i)

        if result == 'no such glass'
            @output.puts "There is no glass at row #{row} and index #{index}."
        elsif result == 0
            @output.puts "That glass is empty"
        else
            @output.puts "There seems to be #{result.to_i}mls in that glass"
        end
    end
end