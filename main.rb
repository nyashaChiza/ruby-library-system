require_relative "user"
require_relative "book"
require_relative "transaction"

# Define the methods for registering, logging in, borrowing, and returning books
def register(name:, surname:, password:)
  user = User.new(name: name, surname: surname, password: password)
end

def login(name:, surname:, password:)
  user = User.new(name: name, surname: surname, password: password)
end

def borrow_book(user:, book:, period:)
  if book.in_use_status == false
    transaction = Transaction.new(user: user, book: book, period: period)
  else
    "book is currently in use"
  end
end

def return_book(transaction:)
  if transaction.book
    transaction.status = "Complete" 
    transaction.book.in_use_status = false
  else
    "book not found"
  end
end

def add_book(name:, author:, cost:)
  book = Book.new(name: name, author: author, cost: cost)
end

# Loop to repeatedly prompt the user for input
loop do
  puts "Select an option:"
  puts "1. Register new user"
  puts "2. Login"
  puts "3. Borrow book"
  puts "4. Return book"
  puts "5. Add Book"
  puts "6. Exit"

  user_option = gets.chomp.to_i

  case user_option
  when 1
    puts "Enter your name:"
    name = gets.chomp

    puts "Enter your surname:"
    surname = gets.chomp

    puts "Enter your password:"
    password = gets.chomp

    user = register(name: name, surname: surname, password: password)
    puts "User registered successfully!"

  when 2
    puts "Enter your name:"
    name = gets.chomp

    puts "Enter your surname:"
    surname = gets.chomp

    puts "Enter your password:"
    password = gets.chomp

    user = login(name: name, surname: surname, password: password)
    puts "User logged in successfully!"

  when 3
    puts "Enter the book name:"
    name = gets.chomp

    puts "Enter the book author:"
    author = gets.chomp

    puts "Enter the book cost:"
    cost = gets.chomp.to_f

    book = add_book(name: name, author: author, cost: cost)

    puts "Enter the borrowing period:"
    period = gets.chomp

    transaction = borrow_book(user: user, book: book, period: period)
    puts "Book borrowed successfully!"

  when 4
    puts "Enter the book name:"
    name = gets.chomp

    puts "Enter the book author:"
    author = gets.chomp

    book = Book.new(name: name, author: author)

    transaction = Transaction.new(user: user, book: book)

    return_book(transaction: transaction)
    puts "Book returned successfully!"

  when 5
    

    when 6
    puts "Exiting program..."
    break

  else
    puts "Invalid option. Please try again."
  end
end