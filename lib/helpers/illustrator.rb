class Illustrator
    def initialize(output: $stdout)
        @output = output
    end

    def print_stack(glass_stack)
        spaces = glass_stack.rows.length
        glass_stack.rows.each do |row|
            print_spaces(spaces)
            spaces -= 1
            row.each do |glass|
                print_glass(glass)
            end
            @output.puts('')
        end
    end

    def print_spaces(count)
        count.times do
            @output.print('  ')
        end
    end

    def print_glass(glass)
        if glass.check_content == glass.check_capacity
            @output.print('|█| ')
        elsif glass.check_content == 0
            @output.print('|_| ')
        else
            @output.print('|▄| ')
        end
    end
end