require 'models/glass.rb'

describe 'glass' do
  describe '#pour' do
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

  describe '#check_content' do
    it 'returns 0 after initialisation' do
      glass = Glass.new(500)
      expect(glass.check_content).to eq(0)
    end
    it 'returns 50 after pouring 50' do
      glass = Glass.new(500)
      glass.pour(50)
      expect(glass.check_content).to eq(50)
    end
    it 'returns 100 after pouring 50 twice' do
      glass = Glass.new(500)
      glass.pour(50)
      glass.pour(50)
      expect(glass.check_content).to eq(100)
    end
  end

  describe '#check_capacity' do
    it 'returns given capacity' do
      glass = Glass.new(200)
      expect(glass.check_capacity).to eq(200)
    end
  end
end
