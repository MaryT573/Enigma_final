handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

capitialized_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(capitialized_text)

writer.close
