require './book'
require './rental'
require './student'

describe Book do
  context 'create a book' do
    book = Book.new 'Ruby Testing', 'MJ'

    it 'displays the title and author' do
      expect(book.title).to eq 'Ruby Testing'
      expect(book.author).to eq 'MJ'
    end

    it 'adds a book to rentals' do
      book = Book.new('Jones', 'Indiana')
      student = Student.new(7, 'Max', true)
      rental_book = book.add_rental(student, '2022-02-02')
      expect(rental_book).to be_a Rental
    end

    it 'returns a hash representation of the book' do
      book_title = 'The Great Gatsby'
      book_author = 'F. Scott Fitzgerald'
      book = Book.new(book_title, book_author)

      expected_hash = {
        title: book_title,
        author: book_author,
        rentals: []
      }

      expect(book.to_h).to eq(expected_hash)
    end
  end
end
