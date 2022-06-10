class Keys
  attr_accessor :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end
end
