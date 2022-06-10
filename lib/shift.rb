require 'time'
require_relative 'keys_offsets'

class Shift

  attr_accessor :shift_hash

  def initialize
    @keys_offsets = KeysOffsets.new
    @shift_hash = {
      :A => (@keys_offsets.key[0..1] << @keys_offsets.offset[0]).sum,
      :B => (@keys_offsets.key[1..2] << @keys_offsets.offset[1]).sum,
      :C => (@keys_offsets.key[2..3] << @keys_offsets.offset[2]).sum,
      :D => (@keys_offsets.key[3..4] << @keys_offsets.offset[3]).sum
    }
  end

  def shifted(message)
    message = message.downcase
  end
end
