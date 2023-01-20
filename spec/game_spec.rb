require_relative '../modules/game'

RSpec.describe Game do
  context 'When Using can_be_archived? method' do
    it "should return false if parent's method returns false" do
      game = Game.new('2017-11-01', 'test', '2019-12-12')
      expect(game.can_be_archived?).to be false
    end
  end
end
