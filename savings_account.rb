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
# a = Bank::SavingsAccount.new({:id => 1234, :balance => 10000, :open_date => "1994-11-17 14:04:56 -0800"})
# puts a
# puts a.withdraw(1000)
# puts a.add_interest(0.25)
#
#
# #TESTS for error
# b = Bank::SavingsAccount.new({:id => 1235, :balance => 900, :open_date => "1997-11-17 14:04:56 -0800"})
  
