# frozen_string_literal: true

require 'pry'

# This class accepts a string of numbers as input and returns a sum of those numbers as output.
class StringCalculator
  def self.add(numbers)
    raise ArgumentError, 'Only a string argument is allowed.' unless numbers.is_a?(String)

    return 0 if numbers.empty?

    # Default delimiter is ","
    delimiter = ','

    # Check if custom delimiter is provided
    if numbers.start_with?('//')
      delimiter = numbers[2]
      # Remove custom delimiter declaration from numbers string
      numbers = numbers.split("\n", 2)[1]
    end

    # Handle invalid input with comma followed by newline
    return 'Invalid input' if numbers.include?(",\n")

    # Replace new lines with delimiter for handling new lines between numbers
    numbers = numbers.gsub("\n", delimiter)
    nums = numbers.split(delimiter).map(&:to_i)

    # Check for negative numbers
    negatives = nums.select(&:negative?)
    # Raise exception with negative numbers if found
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end
end
