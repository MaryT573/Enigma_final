require './lib/keys_offsets'
require './lib/encrypt'
require './lib/decrypt'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
    @encrypt = Encrypt.new
    @decrypt = Decrypt.new
    @message = "Hello World"
    @message2 = "Hello World!"
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'can encrypt' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end

  it 'can decrypt' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({:date=>"040895", :encryption=>"hello world", :key=>"02715"})
  end
end
