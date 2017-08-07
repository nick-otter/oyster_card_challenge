class OysterCard
  attr_reader :balance
  attr_accessor :top_up
  def initialize(top_up)
    @balance = 0
    @top_up = top_up
  end

DEFAULT_LIMIT = 90

  def top_up
    error_message = 'top up limit reached'
    raise error_message if @balance > DEFAULT_LIMIT
    @balance += @top_up
  end
end
