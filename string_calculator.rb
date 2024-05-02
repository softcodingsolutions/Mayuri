# frozen_string_literal: true

require 'pry'

# This class accepts a string of numbers as input and returns a sum of those numbers as output.
class StringCalculator
  def self.add(numbers)
    validate_input(numbers)
    return 0 if numbers.empty?

    delimiter = get_delimiter(numbers)
    numbers = remove_delimiter_declaration(numbers)

    # Handle invalid input with comma followed by newline
    return 'Invalid input' if numbers.include?(",\n")

    nums = get_numbers(numbers, delimiter)
    check_negative_numbers(nums)
    nums.sum
  end

  def self.validate_input(numbers)
    raise ArgumentError, 'Only a string argument is allowed.' unless numbers.is_a?(String)
  end

  def self.get_delimiter(numbers)
    # Check if custom delimiter is provided
    numbers.start_with?('//') ? numbers[2] : ','
  end

  def self.remove_delimiter_declaration(numbers)
    # Remove custom delimiter declaration from numbers string
    numbers.start_with?('//') ? numbers.split("\n", 2)[1] : numbers
  end

  def self.get_numbers(numbers, delimiter)
    # Replace new lines with delimiter for handling new lines between numbers
    numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def self.check_negative_numbers(nums)
    # Check for negative numbers
    negatives = nums.select(&:negative?)
    # Raise exception with negative numbers if found
    raise "negative numbers are not allowed, such as #{negatives.join(',')}" if negatives.any?
  end
end
