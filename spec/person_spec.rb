require './person'
require './book'
require './rental'

describe Person do
  context 'Creating a person and checking various methods' do
    person = Person.new(39, 'Mert')
    it 'return the age and name of the person' do
      expect(person.age).to eql 39
      expect(person.name).to eql 'Mert'
    end

    it 'returns false when the person does not have parent permission and he is underage' do
      person = Person.new(15, 'Max', parent_permission: false)
      expect(person.can_use_services?).to eql false
    end

    it 'returns rental book for the person' do
      person = Person.new(24, 'Josue')
      book = Book.new('LOTR', 'Tolkien')
      rental = Rental.new('2022-02-02', book, person)
      expect(person.rentals).to include(rental)
    end
  end
end
