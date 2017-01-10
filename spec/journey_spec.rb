require "journey"

describe Journey do
  let(:station) {double :Kings, name: "Kings",zone: 1}
  let(:end_station) {double :Pimlico, name: "Pimlico",zone: 1}
  subject {described_class.new(station)}

  it{is_expected.to be_in_journey} ##

  it'has a start station set' do
    expect(subject.start_station).to eq station
  end

  it'has an end station set' do
    subject.end end_station
    expect(subject.end_station).to eq end_station
  end
end
