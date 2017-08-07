require "oyster_card.rb"
describe OysterCard do
	describe '#initialize' do
		it "default balance 0" do
			oyster = OysterCard.new
			expect(oyster.balance).to eq(0)
		end
	describe '#.topup' do
		it "adds given value to balance" do
			oyster = OysterCard.new
			expect(oyster.top_up(25)).to include("25")
		end
		it 'raises error, max limit reached' do
			oyster = OysterCard.new
			expect{ oyster.top_up(91) }.to raise_error 'top up limit reached'
		end
	end
  end
end
