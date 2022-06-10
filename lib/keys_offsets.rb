require 'time'
class KeysOffsets

  attr_accessor :character_set, :randomnum, :transmission

  def initialize
    @character_set = ("a".."z").to_a << " "
    @randomnum = (4.times.map {rand(10)}).unshift(0)
    date = Time.now
    @transmission = date.strftime("%m%d%y")
  end
end
