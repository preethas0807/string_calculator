require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    before(:each) do
      StringCalculator.class_variable_set(:@@call_count, 0)
    end

    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add('1')).to eq(1)
      expect(StringCalculator.add('4')).to eq(4)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add('1,2')).to eq(3)
      expect(StringCalculator.add('20,30')).to eq(50)
    end

    it 'returns the sum of unknown number of inputs' do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles newlines as delimiters' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end

    it 'handles single custom delimiter' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//:\n1:2:3")).to eq(6)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add('1,-2,3,-4') }.to raise_error('Negatives are not allowed: -2, -4')
      expect { StringCalculator.add('-1') }.to raise_error('Negatives are not allowed: -1')
    end

    it 'ignores numbers greater than 1000' do
      expect(StringCalculator.add('2,1001,3')).to eq(5)
      expect(StringCalculator.add('1001')).to eq(0)
    end

    it 'handles multiple delimiters' do
      expect(StringCalculator.add("//[;][%]\n1;2%3")).to eq(6)
      expect(StringCalculator.add("//[,][:][*]\n1*2,3:4")).to eq(10)
    end

    it 'handles delimiters of any length' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      expect(StringCalculator.add("//[***][::]\n1***2::3")).to eq(6)
    end

    it 'tracks the number of times add is called' do
      StringCalculator.add("1,2")
      StringCalculator.add("3,4")
      expect(StringCalculator.get_called_count).to eq(2)
    end
  end
end