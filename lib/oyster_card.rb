require_relative './journey.rb'
require_relative './station.rb'

MAX_BALANCE = 90
MINIMUM_FARE = 1
DEFAULT_BALANCE = 0
PENALTY_FARE = 6

class OysterCard
  attr_reader :balance, :oyster_all_trips, :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @oyster_all_trips = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if exceeded_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient funds' if insufficient_funds?
    @journey.store_entry(entry_station)

  end

  def touch_out(exit_station)
    deduct(journey.fare)
    @journey.store_exit(exit_station)
    @oyster_all_trips << @journey.current_journey
    @journey.current_journey = {}
    @journey.entry_station = nil
  end

  private

  def exceeded_limit?(amount)
    @balance + amount > MAX_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(amount)
    @balance -= amount
  end
end
