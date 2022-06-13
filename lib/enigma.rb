require 'time'
require_relative 'keys_offsets'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  attr_accessor :encrypt, :decrypt

  def initialize
    @encrypt = Encrypt.new
    @decrypt = Decrypt.new
  end

  def encrypt(message, key = @key, date = @offset)
    encryption = @encrypt.encrypt(message, key, date)
    encrypt_hash = {
      :encryption => encryption,
      :key => key,
      :date => date
    }
  end

  def decrypt(message, key, date = @date)
    decryption = @decrypt.decrypt(message, key, date)
    decrypt_hash = {
      :encryption => decryption,
      :key => key,
      :date => date
    }
  end
end
