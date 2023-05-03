require './book'

describe Book do
  context 'create a book' do
    book = Book.new 'Ruby Testing', 'MJ'

    it 'displays the title' do
      expect(book.title).to eq 'Ruby Testing'
    end

    it 'displays the author' do
      expect(book.author).to eq 'MJ'
    end
  end
end
