require './lib/cipher'
require './lib/encrypt'

RSpec.describe Encrypt do
  before(:each) do
    @encryption = Encrypt.new
    @message = "Hello World"
    @message2 = "Hello World!"
  end

  it 'exists' do
    expect(@encryption).to be_a(Encrypt)
  end

  it 'has a shift hash' do
    expect(@encryption.shift_hash).to be_a(Hash)
    expect(@encryption.shift_hash.length).to eq(4)
  end

  it 'can shift message correctly' do
    expect(@encryption.encrypt(@message)).to be_a(String)
  end

  xit 'shift ignores punctuation' do
    expect(@encryption.encrypt(@message2).last).to eq("!")
  end
end
