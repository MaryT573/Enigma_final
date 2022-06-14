require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'

class Decrypt < KeysOffsets
  include Rotatable

  attr_accessor :shift_hash

  def initialize
    super
  end

  def decrypt(message, key, offset = @offset)
    if offset != @offset
      square = (offset.to_i ** 2).to_s.chars.map {|num| num.to_i}
      offset = square[-4..-1]
      @shift_hash = {
        :A => (key[0..1].to_i + offset[0]),
        :B => (key[1..2].to_i + offset[1]),
        :C => (key[2..3].to_i + offset[2]),
        :D => (key[3..4].to_i + offset[3])
      }
    else
      @shift_hash = {
        :A => (key[0..1].to_i + @offset[0]),
        :B => (key[1..2].to_i + @offset[1]),
        :C => (key[2..3].to_i + @offset[2]),
        :D => (key[3..4].to_i + @offset[3])
      }
    end
    shift(message)
  end

  def shift(message)
    reverse
    encrypted = message.downcase.chars.each_slice(4).to_a
    shift = []
    counter = 0
    encrypted.each do |arr|
      arr.each do |char|
        if @character_set.include?(char) == false
           shift << char
        elsif counter == 0
          char = @reverse_rotate_by_shift_A[char]
          shift << char
          counter += 1
        elsif counter == 1
          char = @reverse_rotate_by_shift_B[char]
          shift << char
          counter += 1
        elsif counter == 2
          char = @reverse_rotate_by_shift_C[char]
          shift << char
          counter += 1
        elsif counter == 3
          char = @reverse_rotate_by_shift_D[char]
          shift << char
          counter = 0
        end
      end
    end
    return shift.join
  end
end
