require './book'
require './person'

describe Rental do
  context 'Tracking rental information' do
    book_one = Book.new('LOTR', 'Tolkien')
    book_two = Book.new('Shibumi', 'Grange')
    person_one = Person.new(505, 'Josue')
    person_two = Person.new(222, 'Mert')
    rental_one = Rental.new('2020-20-20', book_one, person_one)
    rental_two = Rental.new('2000-02-02', book_two, person_two)
    rental_three = Rental.new('1980-08-08', book_two, person_one)
    it 'creates and checks rentals' do
      expect(rental_one).to be_a Rental
      expect(person_two.rentals.length).to eql 1
      expect(book_two.rentals.length).to eql 2
      expect(rental_one.date).to eql '2020-20-20'
      expect(book_two.title).to eql 'Shibumi'
      expect(person_one.rentals).to include rental_one && rental_three
      expect(person_two.rentals).to include rental_two
    end
  end
end
