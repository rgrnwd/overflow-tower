require './lib/glass.rb'

describe 'glass' do
  describe "#pour" do
    it 'returns overflow' do
      glass = Glass.new
      expect(glass.pour(250)).to eq(0)
    end
  end
end
