require './lib/cipher'

RSpec.describe Cipher do
  before(:each) do
    @cipher = Cipher.new
  end

  it 'exists' do
    expect(@cipher).to be_a(Cipher)
  end

  it 'has character_set' do
    expect(@cipher.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can generate a sequence of random numbers' do
    expect(@cipher.key.length).to eq(5)
    expect(@cipher.key).to be_a(Array)
    expect(@cipher.key.first).to eq(0)
  end

  it 'can find current time in correct format' do
    expect(@cipher.transmission.length).to eq(6)
  end

  it 'can find offset number' do
    expect(@cipher.offset.length).to eq(4)
    expect(@cipher.offset).to be_a(Array)
  end
end
