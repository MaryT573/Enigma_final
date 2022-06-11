require 'time'
require_relative 'keys_offsets'

class Shift < KeysOffsets

  attr_accessor :shift_hash, :rotate_hash_A, :rotate_hash_B, :rotate_hash_C, :rotate_hash_D

  def initialize
    super
    @shift_hash = {
      :A => (@key[0..1] << @offset[0]).sum,
      :B => (@key[1..2] << @offset[1]).sum,
      :C => (@key[2..3] << @offset[2]).sum,
      :D => (@key[3..4] << @offset[3]).sum
    }
  end

  def rotate_by_shift_A
    @rotate_hash_A = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:A]))]
  end

  def rotate_by_shift_B
    @rotate_hash_B = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:B]))]
  end

  def rotate_by_shift_C
    @rotate_hash_C = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:C]))]
  end

  def rotate_by_shift_D
    @rotate_hash_D = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:D]))]
  end

  def shifted(message)
    rotate_hash_A
    message = message.downcase.chars.each_slice(4).to_a
    message_length = message.length
    shift = []
    message.each do |arr|
      arr.each do |char|
        counter = 0
        if counter == 0
          char = rotate_by_shift_A[char]
          shift << char
          counter += 1
        elsif counter == 1
          char = rotate_by_shift_B[char]
          shift << char
          counter += 1
        elsif counter == 2
          char = rotate_by_shift_C[char]
          shift << char
          counter += 1
        elsif counter == 3
          char = rotate_by_shift_D[char]
          shift << char
          counter += 1
        else
          next
        end
      end
    end
    require "pry"; binding.pry
    return shift.join
  end
end
