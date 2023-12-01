class Transaction
    def initialize(user: user, book: book, period:period)
        @user = user
        @book = book
        @period = period
        @status = "Pending"

        @book.in_use_status = true
    end
end
