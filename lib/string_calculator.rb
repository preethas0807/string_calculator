class StringCalculator
  @@call_count = 0

  def self.add(numbers)
    @@call_count += 1
    return 0 if numbers.empty?

    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      custom_delimiters, numbers = numbers[2..].split("\n", 2)
      delimiters += custom_delimiters.scan(/\[([^\]]+)\]|(.)/).flatten.compact
    end

    delimiter_regex = Regexp.union(delimiters)
    nums = numbers.split(delimiter_regex).map(&:to_i)

    negatives = nums.select { |n| n.negative? }
    raise "Negatives are not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end

  def self.get_called_count
    @@call_count
  end
end
