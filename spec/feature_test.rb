require './lib/oyster_card.rb'
require './lib/station.rb'
require './lib/journey.rb'
oystercard = OysterCard.new
journey = Journey.new
p oystercard.balance
p oystercard.max?
p oystercard.top_up(40)
p oystercard.touch_in('Oxford Circus')
p journey.current_journey
p oystercard.in_journey?
p oystercard.touch_out('Liverpool Street')
p journey.current_journey
p oystercard.touch_in("London Bridge")
p oystercard.touch_out("Waterloo")
p oystercard.journey_history
p oystercard.journey
