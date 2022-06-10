require './lib/keys_offsets'
require './lib/shift'

RSpec.describe Shift do
  before(:each) do
    @keysoffsets = KeysOffsets.new
    @shifts = Shift.new
  end

  it 'exists' do
    expect(@shifts).to be_a(Shift)
  end

  it 'has a shift hash' do
    expect(@shifts.shift_hash).to be_a(Hash)
    expect(@shifts.shift_hash.length).to eq(4)
  end
end
