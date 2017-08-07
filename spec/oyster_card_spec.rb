require "oyster_card.rb"
describe OysterCard do
	describe '#initialize' do
		it "default balance 0" do
			oyster = OysterCard.new(0)
			expect(oyster.balance).to eq(0)
		end
	describe '#.topup' do
		it "adds given value to balance" do
			oyster = OysterCard.new(25)
			expect(oyster.new_balance).to eq(25)
		end
    end
end
end
