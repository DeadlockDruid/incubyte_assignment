class StringCalculatorErrors < StandardError; end

class StringCalculator
  def add(numbers_string)
    return 0 if numbers_string.empty?

    numbers_list = parse_numbers(numbers_string)
    numbers_list.reduce(0, :+)
  end

  private

    def parse_numbers(numbers_string)
      delimiter, numbers_string = get_delimiter_and_numbers(numbers_string)

      numbers_array = get_numbers_list(delimiter, numbers_string)

      check_for_negative_numbers(numbers_array)
      numbers_array.reject { |number| number > 1000 }
    end

    def get_delimiter_and_numbers(numbers_string)
      delimiter = ','

      if numbers_string.start_with?('//')
        delimiter = numbers_string[2]
        numbers_string = numbers_string[2..-1]
      end

      return delimiter, numbers_string
    end

    def get_numbers_list(delimiter, numbers_string)
      numbers_string = numbers_string.gsub(delimiter, ',').gsub('\n', ',')

      numbers_string.split(',').map(&:to_i)
    end

    def check_for_negative_numbers(numbers_array)
      negative_numbers = numbers_array.select { |number| number < 0 }

      unless negative_numbers.empty?
        raise StringCalculatorErrors, "Negative numbers not allowed: #{negative_numbers.join(', ')}"
      end

      numbers_array
    end
end
