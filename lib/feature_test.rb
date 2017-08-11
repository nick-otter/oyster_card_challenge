require './oyster_card.rb'
require './station.rb'
require './journey.rb'

oystercard = OysterCard.new
journey = Journey.new
p oystercard.balance
p oystercard.top_up(40)
p oystercard.touch_in('Oxford Circus')
p journey.current_journey
p journey.in_journey?
p oystercard.touch_out('Liverpool Street')
p journey.current_journey
p oystercard.touch_in('London Bridge')
p oystercard.touch_out('Waterloo')
p oystercard.oyster_all_trips
p journey.current_journey
