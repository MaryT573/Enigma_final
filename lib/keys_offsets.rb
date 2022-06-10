require 'time'
class KeysOffsets

  attr_accessor :character_set, :key, :transmission, :offset

  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = (4.times.map {rand(10)}).unshift(0)
    @transmission = Time.now.strftime("%m%d%y")
    square = (@transmission.to_i * @transmission.to_i).to_s.chars.map {|num| num.to_i}
    @offset = square[6..9]
  end
end
