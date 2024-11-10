require_relative '../string_calculator'

# String calculator tests
RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of two or more numbers' do
      expect(calculator.add('1,2,3,4,5,6,7,8,9,10')).to eq(55)
    end

    it 'returns the sum of numbers when string has newline characters as delimiter' do
      expect(calculator.add('1,2,3,4\n5,6,7\n8,9,10')).to eq(55)
    end

    it 'returns the sum of numbers when string has a custom delimiter' do
      expect(calculator.add('//;\n1;2;3')).to eq(6)
    end

    it 'raises an exception for negative numbers' do
      expect { calculator.add('1,-2,-3,4,-5') }.to raise_error(StringCalculatorErrors, 'Negative numbers not allowed: -2, -3, -5')
    end

    it 'ignores numbers over 1000' do
      expect(calculator.add('2, 1001')).to eq(2) 
    end

    it "doesn't ignore numbers equal to or less than 1000" do
      expect(calculator.add('2, 1000')).to eq(1002) 
    end
  end
end
