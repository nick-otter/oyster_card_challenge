require 'oyster_card'
require 'station'
require 'journey'

RSpec.describe OysterCard do
  let(:station) { double :station }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  context '#balance' do
    it 'should respond to balance' do
      expect(subject).to respond_to(:balance)
    end
    it 'should show a balance' do
      subject.top_up 10
      expect(subject.balance).to be > 0
    end
    it 'has a default balance of 0' do
      expect(subject.balance).to be_zero
    end
  end

  context '#top_up' do
    it 'should respond to top up' do
      expect(subject).to respond_to(:top_up)
    end
    it 'should increase the balance by an amount' do
      opening_balance = subject.balance
      expect(subject.top_up(5)).to eq(opening_balance + 5)
    end
    it 'should raise an error if topping up over limit' do
      error = "Balance cannot exceed #{MAX_BALANCE}"
      expect { subject.top_up(91) }.to raise_error(error)
    end
  end

  context '#touch_in' do
    it 'should raise error if insufficient funds' do
      expect { subject.touch_in }.to raise_error 'Insufficient funds'
    end
  end
  context '#touch_out' do
    before { subject.instance_variable_set(:@balance, 30) }
    before { subject.touch_in(station) }
    it 'should reduce the balance by the minimum fair' do
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end
    it '.deduct' do
      expect(subject).to respond_to(:deduct)
    end
  end


journey = Journey.new

context 'Journey' do
  it 'records starting station' do
    subject.top_up 10
    subject.touch_in(station)
    expect(journey.current_journey).to include('station' => 'not touched out yet')
  end
  it 'is in journey once they touch in' do
    subject.touch_in(station)
    expect(journey.in_journey?).to be_true
  end
  it 'forgets entry station on touch out' do
    subject.touch_out(exit_station)
    expect(journey.current_journey).to be_empty
  end
  it 'is not in a journey once they touch out' do
    subject.touch_in(station)
    subject.touch_out(station)
    expect(journey).to_not be_in_journey
  end
  it 'is not in use when initializing' do
    expect(subject).to_not be_in_journey
  end
end
end
