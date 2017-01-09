require './lib/Oystercard'
  describe Oystercard do

  it 'has a starting balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "is updated" do
      subject.top_up 50
      expect(subject.balance).to eq(50)
    end
    it "should object if told to go above max balance" do
      message = "balance threshold exceeded :£#{Oystercard::BALANCE_MAX}"
      expect{subject.top_up 100}.to raise_error message
    end
  end
  
end
