class Journey
attr_reader :start_station, :end_station, :fare, :in_journey
  DEFAULT_PENALTY = 6
  MINIMUM_FARE = 1

#add a condition here, to check in_journey = true else raise error
#apply penalty_charge
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
#Does not charge penalty as checks for journey start_station
#it holds last one, need to access card level one.
#needs to be a hash so you can access the appropriate one
  def calculate_fare
    start_station ? MINIMUM_FARE : DEFAULT_PENALTY
  end

  # def nil_start_station
  #   start_station = nil
  # end

end
