require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'

class Encrypt < KeysOffsets
  include Rotatable

  attr_accessor :shift_hash

  def initialize
    super
  end
end
