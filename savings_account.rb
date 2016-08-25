require_relative 'account'

module Bank
  class SavingsAccount < Account # inherit from Account class

    def initialize(balance) # initialize with a balance
      @balance = balance
      @minimum_balance = 1000

      if @balance < @minimum_balance #??CAN THIS BE SUPER(ed) WITHOUT HASH INPUT IN ACCOUNT MUCKING IT ALL UP?
        raise ArgumentError.new("Cannot create an account with less than #{@minimum_balance}.")
      end
    end

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
