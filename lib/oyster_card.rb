class OysterCard
  attr_reader :balance
  attr_accessor :top_up
  def initialize(top_up)
    @balance = 0
    @top_up = top_up
  end

  def new_balance
    return @balance + @top_up
  end
end
