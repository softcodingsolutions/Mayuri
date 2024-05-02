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

    it 'returns the sum of two numbers separated by comma' do
      expect(described_class.add('1,5')).to eq(6)
    end
  end
end
