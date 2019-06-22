class Illustrator
    def initialize(output: $stdout)
        @output = output
    end

    def print_glass(glass)
        if glass.check_content == glass.check_capacity
            @output.print('|█|')
        elsif glass.check_content == 0
            @output.print('|_|')
        else
            @output.print('|▄|')
        end
    end
end