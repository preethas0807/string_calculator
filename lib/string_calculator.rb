class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      custom_delimiters, numbers = numbers[2..].split("\n", 2)
      if custom_delimiters.start_with?("[")
        # Multiple single-character delimiters in brackets
        delimiters += custom_delimiters.scan(/\[.\]/).map { |d| d[1] }
      else
        # Single-character delimiter without brackets
        delimiters << custom_delimiters
      end
    end

    delimiter_regex = Regexp.union(delimiters)
    nums = numbers.split(delimiter_regex).map(&:to_i)

    negatives = nums.select { |n| n.negative? }
    raise "Negatives are not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end
end
