require_relative '../modules/label'

RSpec.describe Label do
  context 'can_be_archived?()' do
    it 'shoud return "olivier"' do
      item = Item.new('2022-01-01')
      label = Label.new('olivier', 'red')
      expect(label.add_item(item).title).to eq 'olivier'
    end

    it 'shoud return "red"' do
      item = Item.new('2022-01-01')
      label = Label.new('olivier', 'red')
      expect(label.add_item(item).color).to eq 'red'
    end
  end
end
