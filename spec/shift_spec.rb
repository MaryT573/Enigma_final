require './lib/keys_offsets'
require './lib/shift'

RSpec.describe Shift do
  before(:each) do
    @shifts = Shift.new
    @message = "Hello World"
    @message2 = "Hello World!"
  end

  it 'exists' do
    expect(@shifts).to be_a(Shift)
  end

  it 'has a shift hash' do
    expect(@shifts.shift_hash).to be_a(Hash)
    expect(@shifts.shift_hash.length).to eq(4)
  end

  it 'can shift message correctly' do
    expect(@shifts.shifted(@message)).to be_a(String)
  end

  it 'shift ignores punctuation' do
    expect(@shifts.shifted(@message2).last).to eq("!")
  end
end
