require './lib/Oystercard'
describe Oystercard do

let(:station) {double :kings_cross, name: "Kings Cross"}

  it 'should have starting balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "should update" do
      random_number = rand (1..Oystercard::BALANCE_MAX)
      expect{subject.top_up random_number}.to change{subject.balance}.by random_number
    end
    it "should object if told to go above max balance" do
      message = "balance threshold exceeded :£#{Oystercard::BALANCE_MAX}"
      expect{subject.top_up Oystercard::BALANCE_MAX + 1}.to raise_error message
    end
  end

  describe "#in_journey?" do
    it{is_expected.not_to be_in_journey}
  end

  describe "#touch_in" do
    it "should raise errors if below balance_min" do
      expect{subject.touch_in}.to raise_error "balance too low for journey"
    end
    context "has enough money on card" do
      before(:each){subject.top_up Oystercard::BALANCE_MAX}
      it "should set start_station to current station" do
        subject.touch_in station
        expect(subject.start_station.name).to eq "Kings Cross"
      end
      it "should change state to in use" do
        subject.touch_in station
        expect(subject).to be_in_journey
      end
    end
  end

  describe "#touch_out" do
    it "should not be in a journey after touching out" do
      subject.top_up Oystercard::BALANCE_MIN
      subject.touch_in station
      subject.touch_out
      is_expected.not_to be_in_journey
    end
    it "should deduct money after a journey" do
      subject.top_up Oystercard::BALANCE_MIN
      subject.touch_in station
      expect{subject.touch_out}.to change{ subject.balance }.by -Oystercard::BALANCE_MIN
    end
  end
end
