# frozen_string_literal: true

require_relative '../string_calculator'

describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(described_class.add('1')).to eq(1)
    end

    context 'when valid string with numbers' do
      it 'returns the sum of two numbers separated by comma' do
        expect(described_class.add('1,5')).to eq(6)
      end

      it 'handles any amount of numbers' do
        expect(described_class.add('1,2,3,4,5,8,4,3,7')).to eq(37)
      end
    end

    context 'when invalid arguments are passed' do
      it 'raises error when different argument type passed' do
        expect { described_class.add(5) }.to raise_error(ArgumentError, 'Only a string argument is allowed.')
      end

      it 'raises error when more than one argument is passed.' do
        expect { described_class.add('3', '9') }.to raise_error(ArgumentError, /wrong number of arguments/)
      end

      it 'raises an error when more than one integer is passed as an argument.' do
        expect { described_class.add(7, 4) }.to raise_error(ArgumentError, /wrong number of arguments/)
      end
    end
  end
end
