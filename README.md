# README

# String Calculator

This project demonstrates the principles of Test-Driven Development (TDD) through the implementation of a simple string calculator. The `StringCalculator` class provides an `add` method that handles various cases of number addition from a string input, including handling custom delimiters and throwing exceptions for negative numbers.

## Features

- Performs addition on a simple string of length up to 2.
- Handles an unknown amount of numbers.
- Handles new lines between numbers.
- Supports custom delimiters specified in the format `//[delimiter]\n[numbers...]`.
- Throws an exception for negative numbers, listing all negative values.
- Numbers bigger than 1000 are ignored.
- Delimiters can be of any length with the following format: "//[delimiter]\n"
- Multiple delimiters of any length are allowed like this: "//[delim1][delim2]\n"

## Usage

### Installation

1. Clone the repository:

```sh
git clone https://github.com/anshu1992/string_calculator
cd string_calculator
```

2. Install dependencies:

```sh
bundle install
```

### Running Tests

The project uses RSpec for testing. To run the tests, use the following command:

```sh
bundle exec rspec
```

### Example

Here is a simple example of how to use the `StringCalculator` class:

```ruby
require_relative 'string_calculator'

calculator = StringCalculator.new
puts calculator.add("1,2")                      # Output: 3
puts calculator.add("1,2,3,4,5")                # Output: 15
puts calculator.add("1\n2,3")                   # Output: 6
puts calculator.add("//;\n1;2;3")               # Output: 6
puts calculator.add('1,-2,-3,4,-5')             # Output: error: Negative numbers not allowed: -2, -3, -5
puts calculator.add('2, 1001')                  # Output: 2
puts calculator.add('//[***]\n1***2***3')       # Output: 6
puts calculator.add('//[**][%%%%]\n1**2%%%%3')  # Output: 6
```

## StringCalculator Class

The `StringCalculator` class provides a method `add` which takes a string of numbers and returns their sum.

### Method: `add`

#### Parameters

- `numbers_string` (String): The string containing numbers separated by delimiters.

#### Returns

- Integer: The sum of the numbers in the input string.

#### Raises

- StringCalculatorErrors: If the input string contains negative numbers. The exception message lists all negative numbers found.

## Covered Cases

| Commit Link                                                                                                             | Description                                                                          |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| [Case 1](https://github.com/DeadlockDruid/incubyte_assignment/commit/9493d0c91db27bb0b4060db1ffb472fcf4f5c567)                | Performs addition on a simple string of up to length 2                               |
| [Case 2](https://github.com/DeadlockDruid/incubyte_assignment/commit/b4def4bdf0ac902a15be5fceafe96bb241e138e3) | Allows the `add` method to handle an unknown amount of numbers                       |
| [Case 3](https://github.com/DeadlockDruid/incubyte_assignment/commit/d8e022543eca1996d83ab255dc19e637acaf8e7f)                | Allows the `add` method to handle new lines between numbers                          |
| [Case 4](https://github.com/DeadlockDruid/incubyte_assignment/commit/17dec741b500813a196dd747bb80921957f7bed1)                | Supports custom delimiters                                                           |
| [Case 5](https://github.com/DeadlockDruid/incubyte_assignment/commit/ebfdff0740fbc8511a388988a8ecec746e09a5de)                | Calling `add` with a negative number will throw an exception "negatives not allowed" |
| [Refactors Code](https://github.com/DeadlockDruid/incubyte_assignment/commit/d06c774ce5687dc4144ff7295f952191ecb0723c)                | Refactors code so far |
| [Case 6](https://github.com/DeadlockDruid/incubyte_assignment/commit/56205882122526366e7abbabca48a7a756263105)                | Numbers over 1000 should be ignored |
| [Case 7](https://github.com/DeadlockDruid/incubyte_assignment/commit/0f722c35fbc9664226628452cea45a1d6d49a788)                | Delimiters can be of any length |
| [Case 8](https://github.com/DeadlockDruid/incubyte_assignment/commit/c169467afa56dcbed9e159aebe1ee6dd5ca52f06)                | Allow multiple delimiters of any length |
| [Refactors Code](https://github.com/DeadlockDruid/incubyte_assignment/commit/57cd4e0f028c8df527f55da7e6074e6c9d79844e)                | Refactors overall code |


## Project Structure

```
.
- Gemfile: Specifies gem dependencies.
- Gemfile.lock: Locks the gem dependencies to specific versions.
- README.md: Contains the project description and usage instructions.
- string_calculator.rb: Contains the StringCalculator class implementation.
- spec/
  - spec_helper.rb: Configures the RSpec environment.
  - string_calculator_spec.rb: Contains RSpec tests for the StringCalculator class.
```
