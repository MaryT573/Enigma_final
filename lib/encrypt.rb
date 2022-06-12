require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'

class Encrypt < KeysOffsets
  include Rotatable

  attr_accessor :shift_hash

  def initialize
    super
    @shift_hash = {
      :A => (@key[0..1] << @offset[0]).sum,
      :B => (@key[1..2] << @offset[1]).sum,
      :C => (@key[2..3] << @offset[2]).sum,
      :D => (@key[3..4] << @offset[3]).sum
    }
  end

  def encrypt(message, key = @key, offset = @offset)
    if key != @key
      key = key.chars.map {|num| num.to_i}
      offset = offset.chars.map {|num| num.to_i}
      @shift_hash = {
        :A => (key[0..1] << offset[0]).sum,
        :B => (key[1..2] << offset[1]).sum,
        :C => (key[2..3] << offset[2]).sum,
        :D => (key[3..4] << offset[3]).sum
      }
    end
    message = message.downcase.chars.each_slice(4).to_a
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
    return shift.join
  end
end
