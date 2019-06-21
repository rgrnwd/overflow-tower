require 'models/glass.rb'

describe 'glass' do
  describe "#pour" do
    it 'returns overflow 0 when amount poured less than capacity' do
      glass = Glass.new(250)
      expect(glass.pour(200)).to eq(0)
    end  
    it 'returns overflow 0 when amount poured equals capacity' do
      glass = Glass.new(250)
      expect(glass.pour(250)).to eq(0)
    end
    it 'returns difference overflow when amount poured greater than capacity' do
      glass = Glass.new(250)
      expect(glass.pour(300)).to eq(50)
    end
  end
end
