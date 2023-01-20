require_relative '../modules/author'
require_relative '../modules/game'

describe Author do
  author1 = Author.new('George', 'Martin')
  game1 = Game.new('2015-10-22', false, '2020-1-1')
  context 'when using add_item method' do
    author1.add_item(game1)
    it 'should add self as a property of the item object' do
      expect(game1.author.first_name).to eq 'George'
    end
    it 'should add the input item to the collection of items' do
      expect(author1.items[0]).to eq game1
    end
  end
end
