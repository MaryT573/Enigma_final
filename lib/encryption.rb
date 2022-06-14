require_relative 'encrypt'
@encryption = Encrypt.new
start = File.open(ARGV[0], "r")
incoming_text = start.read
changed_text = @encryption.encrypt(incoming_text, "82648", "240818")
start.close
writer = File.open(ARGV[1], "w")
writer.write(changed_text)
writer.close
puts "Created #{ARGV[1]} with the key 82648 and date 240818"
