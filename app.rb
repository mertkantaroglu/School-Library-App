require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'nameable'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Create book list
  def book_list
    if @books.empty?
      puts 'There are no books in the list'
    else
      @books.each_with_index do |book, index|
        puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
      end
    end
  end

  # Create people list
  def people_list
    if @people.empty?
      puts 'There are no people in the list'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Teacher)
          puts "#{index} - [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Student)
          puts "#{index} - [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  # Create new person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
    number = gets.chomp.to_i
    if number == 1
      create_student
    elsif number == 2
      create_teacher
    else
      puts 'Invalid input'
    end
  end

  # Create new student
  def create_student
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]'
    permission = gets.chomp.upcase
    parent_permission = permission == 'Y'

    @people.push Student.new(age,  parent_permission, name)

    puts 'Student created successfully'
  end

  # Create new teacher
  def create_teacher
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp

    @people.push Teacher.new(name, age, specialization)
    puts 'Teacher created successfully'
  end

  # Create new book
  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)

    @books.push(book)
    puts 'Book created successfully'
  end

  # Create new rental
  def create_rental
    puts 'Select a book index from the following list by number: '
    book_list
    book_index = gets.chomp.to_i
    rented_book = @books[book_index]
    puts 'Select a person index from the following list by number (not id): '
    people_list
    person_index = gets.chomp.to_i
    renter = @people[person_index]
    puts 'Enter a date as (YYYY-MM-DD): '
    date = gets.chomp

    @rentals.push Rental.new(date, rented_book, renter)
    puts 'Rental created successfully'
  end

  # Check rental list
  def rental_list
    people_list
    puts 'Enter ID of person: '
    renter_id = gets.chomp.to_i

    renter = @people.select { |person| person.id == renter_id }
    if @rentals.empty?
      puts 'Rental is empty'
    else
      renter.first.rentals.map do |rental|
        puts "Rental date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end
