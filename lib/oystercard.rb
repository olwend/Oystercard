class Oystercard
  attr_reader :balance, :start_station
  BALANCE_MAX = 90
  BALANCE_MIN = 1

  def initialize
    @balance = 0
  end

  def top_up money
    message = "balance threshold exceeded :£#{BALANCE_MAX}"
    raise message if (@balance + money) > BALANCE_MAX
    @balance += money
  end

  def in_journey?
    !!@start_station
  end

  def touch_in station
    raise "balance too low for journey" if @balance < BALANCE_MIN
    @start_station = station
  end

  def touch_out
    @start_station = nil
    deduct BALANCE_MIN
  end

  private

  def deduct money
    @balance -= money
  end
end
