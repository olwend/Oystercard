require "journey"
describe Journey do
  let(:station) {double :Kings, name: "Kings",zone: 1}
  subject {described_class.new(station)}

  it{is_expected.to be_in_journey} ##

end
