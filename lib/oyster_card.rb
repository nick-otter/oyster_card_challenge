class OysterCard
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def top_up(top_up)
    @balance += top_up
      error_message = "top up limit reached"
      raise error_message if limit?
    return "Your balance is now #{@balance}"
  end

  DEFAULT_LIMIT = 90
  def limit?
    @balance > DEFAULT_LIMIT
  end
end
