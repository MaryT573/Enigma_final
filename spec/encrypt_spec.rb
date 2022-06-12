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

  it 'can shift message correctly' do
    expect(@encrypt.encrypt(@message2)).to be_a(String)
  end

  xit 'shift ignores punctuation' do
    expect(@encrypt.encrypt(@message2).last).to eq("!")
  end
end
