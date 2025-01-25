class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      custom_delimiters, numbers = numbers[2..].split("\n", 2)
      delimiters << custom_delimiters
    end

    delimiter_regex = Regexp.union(delimiters)
    nums = numbers.split(delimiter_regex).map(&:to_i)

    negatives = nums.select { |n| n.negative? }
    raise "Negatives are not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end
end
