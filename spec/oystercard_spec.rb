require './lib/Oystercard'

describe Oystercard do

it 'talks' do
  is_expected.to respond_to :balance
end
it 'has a starting balance of zero' do
  expect(subject.balance).to eq(0)
end
end
