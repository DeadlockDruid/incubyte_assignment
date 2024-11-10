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
  end
end