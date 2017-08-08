require 'oyster_card.rb'
describe OysterCard do
  # subject { Oystercard.new (5)}
  describe '#initialize' do
    it 'default balance 0' do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#.topup' do
    it 'adds given value to balance' do
      expect(subject.top_up(25)).to include('25')
    end
    it 'raises error, max limit reached' do
      expect { subject.top_up(91) }.to raise_error 'top up limit reached'
    end
  end
  describe '#.deduct' do
    it 'deducts fare from balance' do
      opening = subject.balance
      allow(subject).to receive(:top_up).with(10)
      allow(subject).to receive(:deduct).with(10)
      expect(subject.balance).to eq(opening)
    end
  end
end

describe Journey do

	subject { Journey.new (OysterCard.new)}

  describe '#.touch_in/_out, in_journey?' do
    it '.touch_in' do
      expect(subject).to respond_to(:touch_in)
    end
    it 'in_journey?' do
      oyster = OysterCard.new
			oyster.top_up(10)
			journey = Journey.new(oyster)
			journey.touch_in
      expect(journey.in_journey?).to eq(true)
    end
		it 'can\'t touch in, low funds' do
			expect { subject.touch_in }.to raise_error('You have insufficient funds')
		end
    it '.touch_out' do
      expect(subject).to respond_to(:touch_out)
    end
    it 'confirms touch_out' do
      expect { subject.touch_out }.to raise_error('You have already touched out')
    end
  end
end
