class Oystercard

attr_reader :balance, :state


MAXIMUM_BALANCE = 90

  def initialize
   @balance = 0
   @state = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE}exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
   @balance -= amount
  end

  def touch_in
    @state = true
  end

  def in_journey?
    @state
  end

  def touch_out
    @state = false
  end

end
