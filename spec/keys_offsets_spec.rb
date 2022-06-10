require './lib/keys_offsets'

RSpec.describe KeysOffsets do
  before(:each) do
    @keysoffsets = KeysOffsets.new
  end

  it 'exists' do
    expect(@keysoffsets).to be_a(KeysOffsets)
  end

  it 'has character_set' do
    expect(@keysoffsets.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can generate a sequence of random numbers' do
    expect(@keysoffsets.key.length).to eq(5)
    expect(@keysoffsets.key).to be_a(Array)
    expect(@keysoffsets.key.first).to eq(0)
  end

  it 'can find current time in correct format' do
    expect(@keysoffsets.transmission.length).to eq(6)
  end

  it 'can find offset number' do
    expect(@keysoffsets.offset.length).to eq(4)
    expect(@keysoffsets.offset).to be_a(Array)
  end
end
