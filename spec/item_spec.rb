require_relative '../modules/item'

RSpec.describe Item do
  context 'move_to_archive' do
    it 'should return true' do
      result = Item.new('2012/01/01')
      expect(result.move_to_archive?).to be true
    end

    it 'should return true or false' do
      result = Item.new('2022/01/01')
      expect(result.move_to_archive?).to be false
    end
  end
end
