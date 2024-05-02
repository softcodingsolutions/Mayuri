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

    it 'handles new lines between numbers' do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    context 'when the string contains an invalid newline character' do
      it "return error when invalid \n passed at end" do
        expect(described_class.add("1,\n")).to eq 'Invalid input'
      end

      it "return error when invalid \n passed at beginning without number" do
        expect(described_class.add("2,\n, 6")).to eq 'Invalid input'
      end
    end

    it 'supports different delimiters' do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    context 'when the string contains negative numbers' do
      it 'raises an exception with the message' do
        expect { described_class.add('-4,1,-9') }.to raise_error(RuntimeError, 'negative numbers are not allowed, such as -4,-9')
      end

      it 'raises an exception when a negative number is provided along with a different delimiter' do
        expect { described_class.add("//;\n4;2;-8") }.to raise_error(RuntimeError, 'negative numbers are not allowed, such as -8')
      end

      it 'does not raise an exception with correct data' do
        expect { described_class.add("//;\n7;4,3") }.not_to raise_error
      end
    end
  end
end
