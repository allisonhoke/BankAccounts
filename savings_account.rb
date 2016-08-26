require_relative 'account'

module Bank
  class SavingsAccount < Account # inherit from Account class
  MINIMUM_BALANCE = 1000

    def withdraw(amount)
      fee = 200 # each transaction incurs a fee of $2
      amount += fee # include $2 fee in amount
      super # inherit conditional to determine if there is enough in account to make this withdraw
    end

    def add_interest(rate)
      interest = @balance * rate / 100 #var. holds calculated interest
      @balance += interest #update balance
      return interest #return the amount of interest
    end
  end
end

#TESTS
a = Bank::SavingsAccount.new({:id => 1234, :balance => 10000, :open_date => "1994-11-17 14:04:56 -0800"})
puts a
puts a.withdraw(1000)
puts a.add_interest(0.25)


#TESTS for error
b = Bank::SavingsAccount.new({:id => 1235, :balance => 900, :open_date => "1997-11-17 14:04:56 -0800"})














#     def self.all
#       accounts = []
#       CSV.read("savings.csv").each do |line|
#         account = {} #create empty hash to store this CSV line's data
#
#         account[:id] = line[0].to_i
#         account[:balance] = line[1].to_i
#         account[:open_date] = line[2]
#
#         accounts << self.new(account) #create new instance with hash info
#       end
#       accounts #returns an array of object: Account instances
#     end
#
# #THIS DOESN'T WORK
#     def self.find(id)
#       self.all.each do |o|
#         if o.id == id
#           return o #returns an object: Account
#         end
#       end
#     end
