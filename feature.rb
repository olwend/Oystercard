require_relative './lib/oystercard'

oystercard = Oystercard.new
oystercard.top_up(40)
oystercard.touch_in
#oystercard.station
oystercard.touch_out
oystercard.balance
#oystercard.top_up(52)
