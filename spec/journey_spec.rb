require "journey"

describe Journey do
  let(:station) {double :Kings, name: "Kings",zone: 1}
  let(:end_station) {double :Pimlico, name: "Pimlico",zone: 1}


  subject {described_class.new(station)}
  describe "#new" do
    it{is_expected.to be_in_journey} ##
    it'has a start station set' do
      expect(subject.start_station).to eq station
    end
    it "has a penalty" do
      expect(Journey::DEFAULT_PENALTY.class).to eq Fixnum
    end
  end

  describe "end_station" do
    it'has an end station set' do
      subject.end end_station
      expect(subject.end_station).to eq end_station
    end
    it "completes a journey" do
      subject.end end_station
      is_expected.not_to  be_in_journey
    end
    it "returns a minimum fare when given a completed journey" do
      expect(subject.calculate_fare).to eq Journey::MINIMUM_FARE
    end

    describe "oystercard tests" do
      describe "#in_journey?" do
        it{is_expected.to be_in_journey}
      end

    end

  end
end
