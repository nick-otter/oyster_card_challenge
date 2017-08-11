require_relative '../lib/journey.rb'
require_relative '../lib/oyster_card.rb'

RSpec.describe Journey do
  let(:oyster) { OysterCard.new }

  it 'add starting station to journey' do
    oyster.top_up 10
    oyster.touch_in('aldgate')
    expect(oyster.journey.current_journey).to include('aldgate' => 'not touched out yet')
  end

  it 'is in journey once they touch in' do
    oyster.top_up(10)
    oyster.touch_in('stepney')
    expect(oyster.journey.in_journey?).to be true
  end

  it 'forgets entry station on touch out' do
    oyster.touch_out('stepney')
    expect(subject.current_journey).to be_empty
  end
  context '#in_journey?' do
    before { oyster.instance_variable_set(:@balance, 30) }
    it { is_expected.to respond_to :in_journey? }
  end
  it 'is not in use when initializing' do
    expect(subject).to_not be_in_journey
  end

  it 'is not in a journey once they touch out' do
    oyster.top_up(10)
    oyster.touch_in('aldgate')
    oyster.touch_out('stepney')
    expect(subject.in_journey?).to be false
  end
end
