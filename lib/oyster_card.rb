require 'journey'
require 'station'

MAX_BALANCE = 90
MINIMUM_FARE = 1
DEFAULT_BALANCE = 0

class OysterCard
  attr_reader :balance :current_journey :all_trips

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @current_journey = {}
    @all_trips = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if exceeded_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient funds' if insufficient_funds?

    journey.store_entry(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    journey.store_exit(exit_station)
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
