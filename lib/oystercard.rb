class Oystercard
  attr_reader :balance
  BALANCE_MAX = 90
  BALANCE_MIN = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up money
    message = "balance threshold exceeded :£#{BALANCE_MAX}"
    raise message if @balance + money > BALANCE_MAX
    @balance += money
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "balance too low for journey" if @balance < BALANCE_MIN
    @in_use = true
  end

  def touch_out
    @in_use = false
    deduct BALANCE_MIN
  end

  private
  def deduct money
    message = "balance top up :£#{money}"
    @balance -= money
  end
end
