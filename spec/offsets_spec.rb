require './lib/offsets'

RSpec.describe Offsets do
  before(:each) do
    @offset = Offsets.new
  end

  it 'exists' do
    expect(@offset).to be_a(Offsets)
  end

  it 'can find current time in correct format' do
    expect(@offset.transmission.length).to eq(6)
  end
end
