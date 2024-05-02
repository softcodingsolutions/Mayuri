# StringCalculatorTdd
The StringCalculator class provides a method to sum up a string of numbers.

## Installation
Clone the repo first from git.
```bash
git clone https://github.com/softcodingsolutions/Mayuri.git
```
Then install required dependencies

```bash
rvm install ruby-3.2.2
bundle install
```

## Usage

```ruby
StringCalculator.add('1,5')
# returns 6

StringCalculator.add("1\n2,3")
# returns 6

StringCalculator.add("//;\n1;2")
# returns 3
```

## Features
- Supports different delimiters
- Handles new lines between numbers
- Throws an exception for negative numbers
- Returns "Invalid input" for invalid input strings

## Run test cases

Run the following command to execute RSpec tests:
```bash
rspec
```
