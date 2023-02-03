require './app'

def instructions
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a give person id"
    puts "7 - Exit"
end

def user_input
    input = gets.chomp
    case input
    when "1"
        books()
        puts ''
        instructions()
        user_input()
    when "2"
        people()
        puts ''
        instructions()
        user_input()
    when "3"
        print 'Do you want to create a student(1) or a teacher(2)? [input the number]: '  
        option = gets.chomp
        person(option)
        puts ''
        instructions()
        user_input()
    when "4"
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp
        book(title, author)
        puts ''
        instructions()
        user_input()
    when "5"
        puts 'Select a book from the following list by number'
        get_books()
        index = gets.chomp
        book = get_book(index.to_i)
        puts 'Select a person from the following list by number (not ID)'
        get_people()
        index_p = gets.chomp
        person = get_person(index_p.to_i)
        print 'Date: '
        date = gets.chomp
        rental(date, person, book)
        puts ''
        instructions()
        user_input()
    when "6" 
        print "ID of person: "
        id = gets.chomp
        rentals(id.to_i)
        puts ''
        instructions()
        user_input()
    when "7"
        puts 'Thank you for using this app'  
    end
end

def main
    instructions()
    user_input()
end

main()