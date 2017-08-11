require 'station'
require 'journey'
require 'oyster_card'

RSpec. describe Journey do
  let(:oyster) { OysterCard.new }

  it 'add starting station to journey' do
    oyster.top_up 10
    oyster.touch_in('aldgate')
    expect(oyster.journey).to include('aldgate' => 'not touched out yet')
  end
  it 'forgets entry station on touch out' do
    oyster.touch_out
    expect(subject.journey).to be_empty
  end
  context '#in_journey?' do
    before { oyster.instance_variable_set(:@balance, 30) }
    it { is_expected.to respond_to :in_journey? }
  end
  it 'is not in use when initializing' do
    expect(oyster).to_not be_in_journey
  end

  it 'is in journey once they touch in' do
    subject.touch_in(station)
    expect(oyster).to be_in_journey
  end

  it 'is not in a journey once they touch out' do
    subject.touch_in
    subject.touch_out
    expect(oyster).to_not be_in_journey
  end
end
