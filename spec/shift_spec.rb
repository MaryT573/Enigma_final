require './lib/cipher'
require './lib/shift'

RSpec.describe Shift do
  before(:each) do
    @shifts = Shift.new
    @message = "Hello World"
    @message2 = "Hello World!"
    @encrypted = @shifts.shifted(@message)
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


  it 'can unshift message correctly' do
    expect(@shifts.unshifted(@encrypted)).to be_a(String)
    expect(@shifts.unshifted(@encrypted)).to eq("hello world")
  end

  xit 'shift ignores punctuation' do
    expect(@shifts.shifted(@message2).last).to eq("!")
  end
end
