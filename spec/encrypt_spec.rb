require './lib/keys_offsets'
require './lib/encrypt'

RSpec.describe Encrypt do
  before(:each) do
    @encrypt = Encrypt.new
    @message = "Hello World"
    @message2 = "Hello World!"
  end

  it 'exists' do
    expect(@encrypt).to be_a(Encrypt)
  end

  it 'has a randomly generated shift hash' do
    expect(@encrypt.shift_hash).to be_a(Hash)
    expect(@encrypt.shift_hash.length).to eq(4)
  end

  # it 'can encrypt message correctly with specified input' do
  #   expect(@encrypt.encrypt("hello world", "02715", "040895")).to be_a(String)
  #   expect(@encrypt.encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
  # end

  it 'can encrypt message correctly with random generation' do
    expect(@encrypt.encrypt(@message)).to be_a(String)
  end

  xit 'shift ignores punctuation' do
    expect(@encrypt.encrypt(@message2).last).to eq("!")
  end
end
