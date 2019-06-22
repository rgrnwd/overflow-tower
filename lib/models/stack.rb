require 'models/glass.rb'

class Stack

  attr_accessor :rows

  def initialize(levels)
    @levels = levels
    @glass_capacity = 250
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
    rows[0][0].pour(amount)
  end
end
  