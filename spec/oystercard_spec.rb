require './lib/Oystercard'
  describe Oystercard do

  it 'should have starting balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "should update" do
      subject.top_up 50
      expect(subject.balance).to eq(50)
    end
    it "should object if told to go above max balance" do
      message = "balance threshold exceeded :£#{Oystercard::BALANCE_MAX}"
      expect{subject.top_up Oystercard::BALANCE_MAX + 1}.to raise_error message
    end
  end

  describe "#deduct" do
     it "should deduct money" do
       subject.top_up 30
       expect{ subject.deduct 20}.to change{ subject.balance }.by -20
     end
  end

  describe "#in_journey?" do
    it{is_expected.not_to be_in_journey}
  end

  describe "#touch_in" do
    it "should raise errors if below balance_min" do
      expect{subject.touch_in}.to raise_error "balance too low for journey"
    end
    it "should change state to in use" do
      subject.top_up Oystercard::BALANCE_MIN
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_out" do
    it "should not be in a journey after touching out" do
      subject.top_up Oystercard::BALANCE_MIN
      subject.touch_in
      subject.touch_out
      is_expected.not_to be_in_journey
    end
  end
end
