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
      expect{subject.top_up Oystercard::BALANCE_MAX + 1}.to raise_error message
    end
  end

  describe "#deduct" do
     it "is deducted" do
       subject.top_up 30
       expect{ subject.deduct 20}.to change{ subject.balance }.by -20
     end
  end

  describe "in journey" do
    it "touch in changes state to in journey" do
      expect(subject).not_to be_in_journey
    end

    it "touch in changes state to in use" do
      subject.touch_in
      expect(subject).to be_in_journey
    end

  end

end
