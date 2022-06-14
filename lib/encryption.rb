require_relative 'encrypt'
@encryption = Encrypt.new
start = File.open(ARGV[0], "r")
incoming_text = start.read
date = "240818"
key = "82648"
changed_text = @encryption.encrypt(incoming_text, key, date)
start.close
writer = File.open(ARGV[1], "w")
writer.write(changed_text)
writer.close
puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
