# nth prime number

class Prime
  def self.nth(num)
    raise ArgumentError if num.class != Fixnum || num < 1
    counter = 0
    number = 2
    loop do
      if (2..(Math.sqrt(number))).to_a.all? { |n| number % n != 0 }
        counter += 1
        return number if counter == num
      end
      number += 1
    end
  end
end
