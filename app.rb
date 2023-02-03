require './student'
require './teacher'
require './book'
require './rental'


$people_list = []
$book_list = []

def books
    if ($book_list.length != 0)
        $book_list.each do |book|
            res = "Title: #{book.title}, Author: #{book.author}"
            puts res
        end
    else
        puts ''
    end
end

def people
     if ($people_list.length != 0)
        $people_list.each do |person|
            if person[0] == 'Student'
                res = "[Student] Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
                puts res
            elsif person[0] == 'Teacher'
                res =  "[Teacher] Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
                puts res 
            end
        end
    else
        puts ''
    end
end

def add_books(book)
    $book_list << book
end

def add_people(person)
    $people_list << person
end

def person(option)
    if option == '1'
       id = rand(1..1000)
       print "Age: "
       age = gets.chomp
       print "Name: "
       name = gets.chomp
       print "Has parent permission? [Y/N]: "
       permission = gets.chomp
       lower = permission.downcase
       bool = false
       if lower == 'y'
          bool = true
       elsif lower == 'n'
          bool = false
       else
          puts 'invalid option'
          return
       end
       classroom = 'unknown'
       student = Student.new(id, age, classroom,  name, parent_permission: bool)
       person = []
       person.push('Student')
       person.push(student)
       add_people(person)
       puts 'Person created successfully'
    elsif option == '2'
       id = rand(1..1000)
       print "Age: "
       age = gets.chomp
       print "Name: "
       name = gets.chomp
       print "Specialization: "
       specialization = gets.chomp
       teacher = Teacher.new(id, age, specialization, name)
       person = []
       person.push('Teacher')
       person.push(teacher)
       add_people(person)
       puts 'Person created successfully'
    else
        puts 'Invalid option'
    end
end

def book(title, author)
    book = Book.new(title, author)
    add_books(book)
    puts 'Book created successfully'
end

def rental(date, person, book)
    rental = Rental.new(date, person, book)
    rental.book = book
    rental.person = person
    puts 'Rental created successfully'
end

def rentals(id)
    person = $people_list.find { |person| person[1].id == id}  
    rental = person[1].rentals
    rental.each do |item|
        puts "Date: #{item.date}, Book: \"#{item.book.title}\" by #{item.book.author}"
    end
       
    
    # puts item
end

def get_books
    if ($book_list.length != 0)
        $book_list.each_with_index do |book, index|
            res = "#{index}) Title: #{book.title}, Author: #{book.author}"
            puts res
        end
    else
        puts ''
    end
end

def get_people
     if ($people_list.length != 0)
        $people_list.each_with_index do |person, index|
            if person[0] == 'Student'
                res = "#{index} [Student] Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
                puts res
            elsif person[0] == 'Teacher'
                res =  "#{index} [Teacher] Name: #{person[1].name}, ID: #{person[1].id}, Age: #{person[1].age}"
                puts res 
            end
        end
    else
        puts ''
    end
end

def get_person(index)
    if($book_list.length == 0)
        puts 'Add person first'
        return
    end
    $people_list[index][1]
end

def get_book(index)
    if($book_list.length == 0)
        puts 'Add book first'
        return
    end
    $book_list[index]
end