require_relative 'owner'

module Bank
  class Account
    attr_accessor :owner, :balance, :id

    def initialize(balance)
      if balance < 0
        raise(ArgumentError)
      end

      @id = rand(111111..999999)
      @balance = balance
      @owner = {} #initializes with a hash with all values nil
    end

    def create_owner(owner_hash)
      @owner = Bank::Owner.new(owner_hash)
    end

    def withdraw(amount)
      if @balance - amount < 0
        puts "Insufficient funds. Transaction cancelled."
        return @balance
      else
        return @balance -= amount
      end
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end
  end
end
