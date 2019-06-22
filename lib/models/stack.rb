require 'models/glass.rb'

class Stack

  attr_accessor :rows

  def initialize(levels, glass_capacity = 250)
    @levels = levels
    @glass_capacity = glass_capacity
    build_stack
  end
    
  def build_stack
    glasses_per_row = 1
    self.rows = []

    @levels.times do
      self.rows.push(build_row(glasses_per_row))
      glasses_per_row += 1
    end
  end

  def build_row(glasses_per_row)
    glasses = []
    glasses_per_row.times do
      glasses.push(Glass.new(@glass_capacity))
    end
    glasses
  end

  def check_glass_content(row, index)
    if row > @levels || index > rows[row - 1].length
      return 'no such glass'
    end

    rows[row - 1][index - 1].check_content
  end

  def pour(amount)
    pour_with_overflow(0, 0, amount)
  end

  def pour_with_overflow(row, index, amount)
    overflow = rows[row][index].pour(amount)

    if overflow > 0
      row += 1
      pour_with_overflow(row, index, overflow / 2)
      pour_with_overflow(row, index + 1, overflow / 2)
    end
  end
end
  