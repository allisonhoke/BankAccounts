require_relative 'account'

module Bank
  class CheckingAccount < Account # inherit from Account class
    attr_accessor :check_counter
    def initialize(account_hash)
      super
      @check_counter = 0
    end

    def withdraw(amount)
      fee = 100 #each transaction incurs fee of $1
      amount += fee #add that fee to the total to be withdrawn
      super #inherit conditional to determine if there is enough money in account
    end

    def withdraw_using_check(amount)
      if @check_counter > 2 #allowed three free checks
        fee = 200 #ensures the correct fee amount
      else
        fee = 0
      end

      amount += fee #adds correct fee to amount
      if @balance - amount < -1000
        puts "Insufficient funds: Account cannot go below -$10.00. Transaction cancelled."
        return @balance
      else
        @check_counter += 1
        return @balance -= amount
      end
    end

    def reset_checks
      @check_counter = 0
    end
  end
end

#TESTS that the check counter works re: fees and cancels transactions when withdraw_using_check is used beyond minimum balance of -10
#ALSO TESTS whether regular withdraw method works when withdrawing too much

# a = Bank::CheckingAccount.new({:id => 1234, :balance => 10000, :open_date => "1994-11-17 14:04:56 -0800"})
# puts a
# puts "free (should be 9000)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "free (should be 8000)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "free (should be 7000)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "NOT FREE (should be 5800)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "NOT FREE (should be 4600)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "NOT FREE(should be 3400)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "INCLUDES FEE (should be 2300) #{a.withdraw(1000)}"
# puts a.check_counter
# puts "NOT FREE (should be 1100)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "NOT FREE (should be ERROR) #{a.withdraw(1010)}"
# puts a.check_counter
# puts "NOT FREE(should be -100)  #{a.withdraw_using_check(1000)}"
# puts a.check_counter
# puts "INCLUDES FEE (should be -1000) #{a.withdraw_using_check(700)}"
# puts a.check_counter
# puts "INCLUDES FEE (should be ERROR) #{a.withdraw_using_check(1200)}"
