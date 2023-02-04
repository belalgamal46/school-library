# rubocop:disable Metrics/MethodLength
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @books = []
    @rental = []
    @people = []
  end

  def list_books
    puts "\nBooks list is empty try creating a book\n\n" if @books.empty?
    puts "\n"
    @books.each_with_index do |book, index|
      puts "(#{index}) Title: #{book.title}, Author: #{book.author} "
    end
    puts "\n"
  end

  def list_people
    puts "\nThere is no list of people try creating a person\n\n" if @people.empty?
    puts "\n"
    @people.each do |person|
      puts " [#{person.role}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def show_people
    @people.each_with_index do |person, index|
      puts "(#{index}) [#{person.role}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
    end
  end

  def show_rental
    puts 'Choose ID of person: '
    show_people
    print "\nEnter person id (not number): "
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each do |rent|
      puts " Date: #{rent.date} Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
      puts "\n"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    print "\nEnter book number: "
    book_id = gets.chomp.to_i
    puts "\nSelect a person from the following list by number (not id)"
    show_people
    print "\nEnter person number: "
    person_id = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    rent = Rental.new(date, @people[person_id], @books[book_id])
    @rental.push(rent)
    puts "Rental created successfully\n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book created successfully\n\n"
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    case num
    when '1'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Parent permisssion [y/n]:'
      permission = gets.chomp
      student = Student.new(age, name, parent_permission: permission)
      @people.push(student)
      puts "Person created successfully\n\n"
    when '2'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name, parent_permission: true)
      @people.push(teacher)
      puts "Person created successfully\n\n"
    else
      puts 'invalid'
    end
  end
end

# rubocop:enable Metrics/MethodLength
