class Oystercard
  attr_reader :balance, :start_station, :journey_history, :journey
  BALANCE_MAX = 90
  BALANCE_MIN = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up money
    message = "balance threshold exceeded :£#{BALANCE_MAX}"
    raise message if (@balance + money) > BALANCE_MAX
    @balance += money
  end

  def deduct money
    @balance -= money
  end

  def touch_in station
    raise "balance too low for journey" if @balance < BALANCE_MIN
    @start_station = station
    @journey = Journey.new station
  end

  def touch_out station
    @journey_history << {start_station: start_station, end_station: station}
    @start_station = nil
    deduct BALANCE_MIN
  end

  def in_journey?
    !!@start_station
  end
end
