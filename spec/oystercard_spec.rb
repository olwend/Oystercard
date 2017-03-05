require './lib/Oystercard'
describe Oystercard do

let(:station)   {double :kings_cross}
let(:station_2) {double :victoria}
  it 'should have starting balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'should have no journey_history' do
    expect(subject.journey_history).to be_empty
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

  describe "#touch_in" do
    it "should raise errors if below balance_min" do
      expect{subject.touch_in station}.to raise_error "balance too low for journey"
    end
    context "has enough money on card" do
      before(:each){subject.top_up Oystercard::BALANCE_MAX}
      it "should set start_station to current station" do
        subject.touch_in station
        expect(subject.start_station).to eq station
      end

      it "should create a journey instance" do
        expect(subject.touch_in station).to eq(subject.journey)
    end
  end

  context "has started journey" do
    before(:each){subject.top_up Oystercard::BALANCE_MAX;subject.touch_in station}
    describe "#touch_out" do

      it "should receive an argument" do
        expect(subject).to respond_to(:touch_out).with(1).argument
      end
      it "should not be in a journey after touching out" do
        subject.touch_out station_2
        expect(subject.journey.in_journey?).to eq false
      end
      it "should deduct money after a journey" do
        expect{subject.touch_out station_2}.to change{ subject.balance }.by -Oystercard::BALANCE_MIN # TODO change to fare once implemented
      end
      it "should forget entry station on touch out" do
        subject.touch_out station_2
        expect(subject.start_station).to eq nil
      end
      it "should store a journey on completion" do
        subject.touch_out station_2
        expect(subject.journey_history).to eq([{start_station: station,end_station: station_2}])
      end
    end
  end

  describe "#journey_history" do
    it{expect(subject.journey_history).to be_empty}
  end

  describe "charge on journey completion" do

    it "deducts the minimum fare if user touches in and out " do
      subject.top_up Oystercard::BALANCE_MAX
      subject.touch_in station
      expect{subject.touch_out(station_2)}.to change{subject.balance}.by -Journey::MINIMUM_FARE
    end

    it "deducts a penalty if user does not touch in" do
      expect{subject.touch_out(station_2)}.to change{subject.balance}.by -Journey::DEFAULT_PENALTY
  end
end

end
end
