class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      nums = numbers.split(delimiter).map(&:to_i)
    else
      nums = numbers.split(/,|\n/).map(&:to_i)
    end

    negatives = nums.select { |n| n.negative? }
    raise "Negatives are not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.sum
  end
end
