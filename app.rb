require "./lib/helpers/console_interface.rb"
require "./lib/helpers/illustrator.rb"

console_interface = ConsoleInterface.new()
illustrator = Illustrator.new()

puts 'Welcome to the Overflow Tower!'
puts '==============================='
print 'Do you want to run with illustrations? (y/n) '
show_illustrations = gets.chomp == 'y'
puts 'There is a stack of water glasses in a form of triangle.'

glass_stack = console_interface.build_glass_stack_from_input
illustrator.print_stack(glass_stack) if show_illustrations

puts 'When a liquid is poured into the top most glass any overflow is evenly '\
'distributed between the glasses in the next row.'
puts 'That is, half of the overflow pours into the left glass while the remainder '\
'of the overflow pours into the right glass.'

console_interface.pour_water_onto_stack(glass_stack)
illustrator.print_stack(glass_stack) if show_illustrations

loop do
    console_interface.display_glass_content(glass_stack)

    print 'Do you want to check another glass? (y/n): '
    answer = gets.chomp
    if answer != 'y'
        break
    end
end