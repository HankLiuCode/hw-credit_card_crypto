module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    check_digit = nums_a.pop
    nums_sum = nums_a.reverse.each_with_index.map do |num, idx|
      double_num = (num * 2) / 10 + (num * 2) % 10
      idx.even? ? double_num : num
    end.sum
    (10 - nums_sum % 10) % 10 == check_digit
  end
end
