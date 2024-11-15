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

      numbers_array = numbers_string.split(delimiter).map(&:to_i)
      check_for_negative_numbers(numbers_array)

      numbers_array.reject { |number| number > 1000 }
    end

    def get_delimiter_and_numbers(numbers_string)
      default_delimiters = [",", "\\n"]
      delimiter = Regexp.union(default_delimiters)

      if numbers_string.start_with?('//')
        delimiter_part, numbers_string = numbers_string.split("\\n", 2)

        if delimiter_part.include?('[')
          custom_delimiters = delimiter_part.scan(/\[(.*?)\]/).flatten
          delimiter = Regexp.union(default_delimiters + custom_delimiters)
        else
          delimiter = Regexp.union(default_delimiters + [delimiter_part[2]])
        end
      end

      [delimiter, numbers_string]
    end

    def check_for_negative_numbers(numbers_array)
      negative_numbers = numbers_array.select { |number| number < 0 }

      unless negative_numbers.empty?
        raise StringCalculatorErrors, "Negative numbers not allowed: #{negative_numbers.join(', ')}"
      end

      numbers_array
    end
end
