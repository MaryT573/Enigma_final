require 'time'
require_relative 'keys_offsets'
require_relative 'rotatable'
require_relative 'encrypt'

class Encryption
  attr_accessor :encryption
    @encryption = Encrypt.new
    start = File.open(ARGV[0], "r")
    incoming_text = start.read
    incoming_text = incoming_text.strip
    changed_text = @encryption.encrypt(incoming_text, "82648", "240818")
    start.close
    writer = File.open(ARGV[1], "w")
    writer.write(changed_text)
    writer.close
    puts "Created #{ARGV[1]} with the key 82648 and date 240818"
end
