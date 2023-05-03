require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative './data/data_preserve'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @people = read_data('./data/people.json')
    @books = read_data('./data/books.json')
    @rentals = read_data('./data/rentals.json')
  end

  # Create book list
  def book_list
    @books = read_data('./data/books.json')
    puts 'There are no books in the list' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book['title'].capitalize}, Author: #{book['author'].capitalize}"
    end
  end

  # Create people list
  def people_list
    @people = read_data('./data/people.json')
    puts 'There are no people in the list' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index} - #{person['class']} Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  # Create new person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
    number = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    if number == 1
      create_student(name, age)
    elsif number == 2
      create_teacher(name, age)
    else
      puts 'Invalid input'
    end
  end

  # Create new student
  def create_student(name, age)
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase == 'Y'

    @people.push Student.new(age, parent_permission, name)
    write_data(@people, './data/people.json')
    puts 'Student created successfully'
  end

  # Create new teacher
  def create_teacher(name, age)
    puts 'Specialization: '
    specialization = gets.chomp

    @people.push Teacher.new(name, age, specialization)
    write_data(@people, './data/people.json')
    puts 'Teacher created successfully'
  end

  # Create new book
  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp

    @books.push Book.new(title, author)
    write_data(@books, './data/books.json')
    puts 'Book created successfully'
  end

  # Create new rental
  def select_book
    book_list
    puts 'Select a book index from the above list by number: '
    book_index = gets.chomp.to_i
    @books[book_index]
  end

  def select_person
    people_list
    puts 'Select a person index from the above list by number: '
    person_index = gets.chomp.to_i
    @people[person_index]
  end

  def create_rental
    rented_book = select_book
    renter = select_person
    puts 'Enter a date as (YYYY-MM-DD): '
    date = gets.chomp

    @rentals.push Rental.new(date, rented_book, renter)
    write_data(@rentals, './data/rentals.json')
    puts 'Rental created successfully'
  end

  def rental_list
    @rentals = read_data('./data/rentals.json') || []
    people_list
    puts 'Enter ID of person: '
    renter_id = gets.chomp.to_i

    if rentals_empty?
      puts 'Rental is empty'
    else
      rentals_for_person = @rentals.select do |rental|
        rental_for_person?(rental, renter_id)
      end

      if rentals_for_person.empty?
        puts 'No rentals found for the given person'
      else
        rentals_for_person.each do |rental|
          puts "Rental date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
        end
      end
    end
  end

  def rentals_empty?
    @rentals.nil? || @rentals.empty?
  end

  def rental_for_person?(rental, renter_id)
    rental['person'] && rental['person']['id'] == renter_id && rental['book']
  end
end
