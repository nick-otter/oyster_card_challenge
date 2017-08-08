class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  LIMIT_EXCEEDED = 'top up limit reached'.freeze

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(top_up)
    @balance += top_up
    raise LIMIT_EXCEEDED if limit?
    "Your balance is now #{@balance}"
  end

  def deduct(amount)
    @balance -= amount
  end

  def limit?
    @balance > DEFAULT_LIMIT
  end
end

class Journey
  TOUCHED_IN = 'touched in'.freeze
  TOUCHED_OUT = 'touched out'.freeze
  MINIMUM = 1

  attr_reader :journey
  attr_reader :entry_station

  def initialize(card) # Pass in instance of Oyster Card
    @card = card
    @journey = journey
    @entry_station = nil
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    raise 'You have insufficient funds' if @card.balance < MINIMUM
    @journey = TOUCHED_IN + " #{@entry_station}"
    "You have touched in at #{@entry_station}"
  end

  def touch_out
    raise 'You have already touched out' unless in_journey?
    @journey = TOUCHED_OUT
    @entry_station = nil
    deduct(@card)
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

  def deduct(card)
    card.balance -= 1
  end
end
