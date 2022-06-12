require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  include Rotatable

def initialize
  @argument = argument
end
