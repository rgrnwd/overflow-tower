require "./lib/models/stack.rb"

class ConsoleInterface
    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end
    
    def build_glass_tower_from_input
        @output.print 'Each glass has a capacity of? (specify number of press enter for default 250ml) '
        capacity = @input.gets.chomp.to_i
        capacity = 250 if capacity == 0
        
        @output.print 'How tall is this stack of glasses? (specify number of press enter for default 5) '
        levels = @input.gets.chomp.to_i
        levels = 5 if levels == 0
        
        @output.puts "Capacity is #{capacity}, and the tower is #{levels} levels high!"
        glass_tower = Stack.new(levels.to_i, capacity.to_i)
    end

end