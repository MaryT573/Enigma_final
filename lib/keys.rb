class Keys
  attr_accessor :character_set, :randomnum

  def initialize
    @character_set = ("a".."z").to_a << " "
    @randomnum = (4.times.map {rand(10)}).unshift(0)
  end
end
