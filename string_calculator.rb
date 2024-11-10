class StringCalculator
  def add(numbers_string)
    return 0 if numbers_string.empty?

    delimiter = ','

    if numbers_string.start_with?('//')
      delimiter = numbers_string[2]
      numbers_string = numbers_string[2..-1]
    end

    numbers_string = numbers_string.gsub(delimiter, ',').gsub('\n', ',')
    numbers_array = numbers_string.split(',').map(&:to_i)
    numbers_array.reduce(0, :+)
  end
end
