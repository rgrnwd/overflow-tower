require "./lib/models/glass.rb"
require "./lib/models/stack.rb"
require "./lib/helpers/console_interface.rb"

console_interface = ConsoleInterface.new()

puts 'Welcome to the Overflow Tower!'
puts '==============================='
puts 'There is a stack of water glasses in a form of triangle.'

glass_tower = console_interface.build_glass_tower_from_input

puts 'When a liquid is poured into the top most glass any overflow is evenly '\
'distributed between the glasses in the next row.'
puts 'That is, half of the overflow pours into the left glass while the remainder '\
'of the overflow pours into the right glass.'
