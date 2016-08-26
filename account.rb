require 'csv'
require_relative 'owner'

module Bank
  class Account
  MINIMUM_BALANCE = 0
  attr_accessor :id, :balance, :open_date, :owner, :minimum_balance
# review these attributes to determine which should be read v accessed

    def initialize(account_hash)

      @id = account_hash[:id]
      @balance = account_hash[:balance]
      @open_date = account_hash[:open_date]
      @owner = {} #initializes with a hash with all values nil

      if @balance < self.class::MINIMUM_BALANCE
        raise ArgumentError.new("Cannot create an account with less than #{self.class::MINIMUM_BALANCE}.")
      end
    end

    def create_owner(owner_hash)
      @owner = Bank::Owner.new(owner_hash)
    end

    def self.all
      accounts = []
      CSV.read("./support/accounts.csv").each do |line|
        account = {} #create empty hash to store this CSV line's data

        account[:id] = line[0].to_i
        account[:balance] = line[1].to_i
        account[:open_date] = line[2]

        accounts << self.new(account) #create new instance with hash info
      end
      accounts #returns an array of object: Account instances
    end

    def self.find(id)
      self.all.each do |o|
        if o.id == id
          return o #returns an object: Account
        end
      end
    end

    def withdraw(amount)
      if @balance - amount < self.class::MINIMUM_BALANCE
        puts "Insufficient funds: Account cannot go below #{self.class::MINIMUM_BALANCE}. Transaction cancelled."
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

#TEST self.all method

# my_accounts = Bank::Account.all
# puts my_accounts
#
# my_accounts.each do |a|
#   puts a.balance
# end

#TEST self.find method

# b = Bank::Account.find(1213)
# puts b
# puts b.balance
# puts b.open_date
