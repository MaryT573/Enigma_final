require 'time'
require_relative 'keys_offsets'

class Shift < KeysOffsets

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

  def shifted(message)
    message = message.downcase
  end
end
