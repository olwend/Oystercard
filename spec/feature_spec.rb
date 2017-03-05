
require './lib/oystercard'
o = Oystercard.new
p o
o.top_up(10)
p o.balance
p o.journey
o.touch_in "Kings_cross"
o.touch_out "Victoria"
p "balance is now #{o.balance}"
p o.journey_history
o.touch_out "Victoria"
p "balance is now #{o.balance}"
o.touch_in "Victoria"
o.touch_in "Euston"
p o.journey_history
o.touch_out "Waterloo"
5.times{o.touch_out "Waterloo"}
p o.journey_history
p "balance is now #{o.balance}"
o.touch_out "Waterloo"
p "balance is now #{o.balance}"
o.touch_in "End of the line"
