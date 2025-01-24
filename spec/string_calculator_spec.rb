require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
  end

  it 'returns the number itself for a single number' do
    expect(StringCalculator.add('1')).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(StringCalculator.add('1,2')).to eq(3)
  end

  it 'returns the sum of unknown number of inputs' do
    expect(StringCalculator.add("1,2,3,4")).to eq(10)
    expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
  end
end