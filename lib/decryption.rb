require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'
require_relative 'decrypt'

class Decryption
  attr_accessor :decryption
  @decryption = Decrypt.new
  start = File.open(ARGV[0], "r")
  encrypted_text = start.read
  encrypted_text = encrypted_text.strip
  start.close
  writer = File.open(ARGV[1], "w")
  key = ARGV[2]
  date = ARGV[3]
  decrypted_text = @decryption.decrypt(encrypted_text, key, date)
  writer.write(decrypted_text)
  writer.close
  puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
end
