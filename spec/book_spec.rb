require_relative '../modules/book'

RSpec.describe Book do
  context 'can_be_archived?()' do
    it 'shoud return true' do
      book = Book.new('2012-01-01', 'olivier', 'bad')
      expect(book.can_be_archived?).to be true
    end

    it 'shoud return true' do
      book = Book.new('2022-01-01', 'olivier', 'bad')
      expect(book.can_be_archived?).to be true
    end

    it 'shoud return false' do
      book = Book.new('2022-01-01', 'olivier', 'good')
      expect(book.can_be_archived?).to be false
    end
  end
end
