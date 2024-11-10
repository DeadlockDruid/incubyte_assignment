class StringCalculator
  def add(numbers_string)
    return 0 if numbers_string.empty?

    numbers_string.gsub('\\n', ',').split(',').map(&:to_i).reduce(0, :+)
  end
end
