# frozen_string_literal: true

# LuhnValidator module
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    check_digit = nums_a.pop
    checksum = generate_checksum(nums_a)
    checksum == check_digit
  end

  def generate_checksum(nums)
    nums_sum = nums.reverse.each_with_index.map do |num, idx|
      double_num = num * 2
      digit_sum = (double_num / 10 + double_num % 10)
      idx.even? ? digit_sum : num
    end.sum
    (10 - nums_sum % 10) % 10
  end
end
