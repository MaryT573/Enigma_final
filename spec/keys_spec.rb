require './lib/keys'

RSpec.describe Keys do
  before(:each) do
    @keys = Keys.new
  end

  it 'exists' do
    expect(@keys).to be_a(Keys)
  end

  it 'has character_set' do
    expect(@keys.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can generate a sequence of random numbers' do
    expect(@keys.randomnum.length).to eq(5)
    expect(@keys.randomnum).to be_a(Array)
    expect(@keys.randomnum.first).to eq(0)
  end
end
