class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  LIMIT_EXCEEDED = 'top up limit reached'.freeze

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(top_up)
    raise LIMIT_EXCEEDED if exceeded_limit?(top_up)
    @balance += top_up
    "Your balance is now #{@balance}"
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def exceeded_limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end
end

class Journey
  TOUCHED_IN = 'touched in'.freeze
  TOUCHED_OUT = 'touched out'.freeze
  MINIMUM = 1

  attr_reader :journey
  attr_reader :entry_station

  def initialize(oystercard) # Pass in instance of Oyster Card
    @oystercard = oystercard
    @journey = journey
    @entry_station = nil
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    raise 'You have insufficient funds' if @oystercard.balance < MINIMUM
    @journey = TOUCHED_IN + " #{@entry_station}"
    "You have touched in at #{@entry_station}"
  end

  def touch_out
    raise 'You have already touched out' unless in_journey?
    @journey = TOUCHED_OUT
    @entry_station = nil
    deduct(@oystercard)
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

  def deduct(oystercard)
    oystercard.balance -= 1
  end
end
