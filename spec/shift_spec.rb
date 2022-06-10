require './lib/keys_offsets'
require './lib/shift'

RSpec.describe Shift do
  before(:each) do
    @keysoffsets = KeysOffsets.new
    @shifts = Shift.new
  end

  it 'exists' do
    expect(@shift).to be_a(Shift)
  end
end
