# pythagorean triplets

class Triplet
  attr_reader :a, :b, :c

  def initialize(n1, n2, n3)
    nums = [n1, n2, n3].sort
    @a = nums[0]
    @b = nums[1]
    @c = nums[2]
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  def self.where(hsh)
    raise ArgumentError 'no max factor' unless hsh[:max_factor]
    triplets = candidates(hsh[:max_factor])
    min_fac = hsh[:min_factor]
    triplets.select! { |triplet| triplet.a >= min_fac } if min_fac
    triplets.select! { |triplet| triplet.sum == hsh[:sum] } if hsh[:sum]
    triplets
  end

  def self.candidates(max_factor)
    triplets = []
    1.upto(max_factor) do |c_val|
      1.upto(c_val) do |b_val|
        1.upto(b_val) do |a_val|
          triplet = Triplet.new(a_val, b_val, c_val)
          triplets << triplet if triplet.pythagorean?
        end
      end
    end
    triplets
  end
end
