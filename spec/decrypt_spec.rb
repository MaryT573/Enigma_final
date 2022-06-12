require './lib/keys_offsets'
require './lib/encrypt'
require './lib/decrypt'

RSpec.describe Decrypt do
  before(:each) do
    @decrypt = Decrypt.new
    @encrypt = Encrypt.new
    @message = "Hello World"
    @message2 = "Hello World!"
    @encrypted = @encrypt.encrypt("hello world", "02715")
  end

  it 'exists' do
    expect(@decrypt).to be_a(Decrypt)
  end

  it 'can decrypt message correctly with specified input' do
    expect(@decrypt.decrypt("keder ohulw", "02715", "040895")).to be_a(String)
    expect(@decrypt.decrypt("keder ohulw", "02715", "040895")).to eq("hello world")
  end

  it 'can decrypt message correctly with only key and no date' do
    expect(@decrypt.decrypt(@encrypted, "02715")).to be_a(String)
    expect(@decrypt.decrypt(@encrypted, "02715")).to eq("hello world")
  end

  it 'decrypt ignores punctuation' do
    expect(@decrypt.decrypt("keder ohulw!", "02715", "040895")).to eq("hello world!")
  end
end
