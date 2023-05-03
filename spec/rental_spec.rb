require './book'
require './person'

describe Rental do
  context 'Tracking rental information' do
    book_1 = Book.new('LOTR', 'Tolkien')
    book_2 = Book.new('Shibumi', 'Grange')
    person_1 = Person.new(505, 'Josue')
    person_2 = Person.new(222, 'Mert')
    rental_1 = Rental.new('2020-20-20', book_1, person_1)
    rental_2 = Rental.new('2000-02-02', book_2, person_2)
    rental_3 = Rental.new('1980-08-08', book_2, person_1)
    it 'creates and checks rentals' do
      expect(rental_1).to be_a Rental
      expect(person_2.rentals.length).to eql 1
      expect(book_2.rentals.length).to eql 2
      expect(rental_1.date).to eql '2020-20-20'
      expect(book_2.title).to eql 'Shibumi'
      expect(person_1.rentals).to include rental_1 && rental_3
      expect(person_2.rentals).to include rental_2
    end
  end
end