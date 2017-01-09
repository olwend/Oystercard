require "oystercard"

describe Oystercard do

  it {is_expected.to respond_to :balance }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to :touch_in }

  it { is_expected.to respond_to :touch_out }

  it { is_expected.to respond_to :in_journey? }

  it 'is initially not in a journey' do
  expect(subject).not_to be_in_journey
 end

  it "can touch in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  describe '#top_up' do

  # it {is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises error if top up exceeds limit' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    expect { subject.top_up 1}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE}exceeded"
  end

  end

  describe "#deduct"

  # it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'deducts an amount from the balance' do
    subject.top_up(20)
    expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
  end

end
