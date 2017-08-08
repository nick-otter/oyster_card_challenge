class OysterCard

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  LIMIT_EXCEEDED = 'top up limit reached'.freeze
  TOUCHED_IN = 'touched in'.freeze
  TOUCHED_OUT = 'touched out'.freeze

  attr_reader :balance
  attr_reader :journey_status

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_status = journey_status
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

  def touch_in
    @journey_status = TOUCHED_IN
  end

  def touch_out
    raise 'You have already touched out' if !in_journey?
    @journey_status = TOUCHED_OUT
  end

  def in_journey?
    @journey_status == TOUCHED_IN
  end
end
