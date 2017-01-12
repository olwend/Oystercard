class Journey
attr_reader :start_station, :end_station
  DEFAULT_PENALTY = 6
  MINIMUM_FARE = 1

  def initialize(start_station = nil)
    @start_station = start_station
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def end station
    @end_station = station
    @in_journey = false
    calculate_fare
  end

  def calculate_fare
    @start_station ? MINIMUM_FARE : DEFAULT_PENALTY
  end
end
