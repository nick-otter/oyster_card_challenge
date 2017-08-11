require 'oystercard'
require 'station'
require 'journey'
oystercard = OysterCard.new
p oystercard.balance
p oystercard.max?
p oystercard.top_up(40)
p oystercard.touch_in('Oxford Circus')
p oystercard.in_journey?
p oystercard.touch_out('Liverpool Street')
p oystercard.touch_in("London Bridge")
p oystercard.touch_out("Waterloo")
p oystercard.journey_history
p oystercard.journey
