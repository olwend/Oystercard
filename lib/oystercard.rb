class Oystercard
  attr_reader :balance
  BALANCE_MAX = 90

  def initialize
    @balance = 0
  end

  def top_up money
    message = "balance threshold exceeded :£#{BALANCE_MAX}"
    raise message if @balance + money > BALANCE_MAX
    @balance += money
  end

  def deduct money
    message = "balance top up :£#{money}"
    @balance -= money
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end
end
