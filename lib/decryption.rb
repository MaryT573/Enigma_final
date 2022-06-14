require_relative 'decrypt'
@decryption = Decrypt.new
start = File.open(ARGV[0], "r")
encrypted_text = start.read
start.close
writer = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]
decrypted_text = @decryption.decrypt(encrypted_text, key, date)
writer.write(decrypted_text)
writer.close
puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
