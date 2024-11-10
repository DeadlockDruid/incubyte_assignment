class StringCalculator
  def add(numbers_string)
    return 0 if numbers_string.empty?
    return numbers_string.to_i if numbers_string.length.eql?(1)

    numbers_string = numbers_string.split(',')

    return numbers_string[0].to_i + numbers_string[1].to_i
  end
end
