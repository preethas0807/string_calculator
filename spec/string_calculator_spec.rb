require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
  end

  it 'returns the number itself for a single number' do
    expect(StringCalculator.add("1")).to eq(1)
  end
end