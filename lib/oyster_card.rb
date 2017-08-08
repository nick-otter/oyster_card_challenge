class OysterCard

  DEFAULT_LIMIT = 90
  LIMIT_EXCEEDED = 'top up limit reached'.freeze

  attr_reader :balance
  def initialize
    @balance = 0
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
