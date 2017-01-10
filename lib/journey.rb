class Journey
  DEFAULT_PENALTY = 6
  def initialize start_station
    @start_station = start_station
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def start_station
    @start_station
  end

  def end_station
    @end_station
  end

  def end station
    @end_station = station
    @in_journey = false
  end

  def calculate_fare zone_1, zone_2
    5
  end
end
