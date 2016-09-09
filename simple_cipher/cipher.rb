# Simple Cipher Challenge

# substitution cipher
class Cipher
  ALPHABET = ('a'..'z').to_a
  attr_reader :key

  def initialize(*key)
    key = key[0]
    if key.nil?
      @key = 100.times.map { ('a'..'z').to_a.sample }.join
    elsif !key.match(/^[a-z]+$/)
      fail(ArgumentError.new, 'key must comprise lowercase letters')
    else
      @key = key
    end
  end

  def encode(plaintext)
    ciphertext = ''
    plaintext.chars.each_with_index do |char, idx|
      ciphertext += char_shift(char, key[idx])
    end
    ciphertext
  end

  def decode(ciphertext)
    plaintext = ''
    ciphertext.chars.each_with_index do |char, idx|
      plaintext += char_unshift(char, key[idx])
    end
    plaintext
  end

  def char_shift(char, shift_char)
    char_idx = ALPHABET.index(char.downcase)
    shift_idx = ALPHABET.index(shift_char)
    ALPHABET[(char_idx + shift_idx) % 26]
  end

  def char_unshift(char, shift_char)
    char_idx = ALPHABET.index(char.downcase)
    shift_idx = ALPHABET.index(shift_char)
    ALPHABET[(char_idx - shift_idx) % 26]
  end
end
