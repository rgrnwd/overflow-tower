class Glass

  def initialize(capacity)
    @content = 0
    @capacity = capacity
  end
  
  def pour(amount)
    @content += amount
    if (@content > @capacity)
      overflow = @content - @capacity
      @content = @capacity
      return overflow
    end

    return 0
  end

  def check_content
    return @content
  end
end
