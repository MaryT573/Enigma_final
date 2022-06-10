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
end
