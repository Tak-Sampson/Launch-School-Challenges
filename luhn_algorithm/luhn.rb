# Luhn Algorithm

class Luhn

  def initialize(number)
    @digits = number.to_s.chars.map {|char| char.to_i }
  end

  def addends
    @digits.reverse.map.with_index do |digit, i|
      (1 + i % 2) * digit >= 10 ? 2 * digit - 9 : (1 + i % 2) * digit
    end.reverse
  end

  def checksum
    sum = 0
    addends.map {|summand| sum += summand}.last
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    10 * number + (10 - self.new(number * 10).checksum % 10) % 10
  end
end