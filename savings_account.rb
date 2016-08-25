class SavingsAccount < Account # inherit from Account class

  def initialize(balance) # initialize with a balance
    @balance = balance

    if @balance < 1000 # if balance is less than 10, raise argument error
      raise ArgumentError.new("Must deposit at least $10.00.")
    end
  end

  def withdraw(amount)
    super
    fee = 200 # each transaction incurs a fee of $2
    total_with_fee = amount + fee
    if @balance - total_with_fee < 1000
      puts "Sorry, your balance cannot go below $10. Transaction cancelled."
      return @balance # output a warning message and return un-modified amount if balance will drop below $10 (including fee)
    else
      return @balance -= total_with_fee
    end 
  end
end



# add interest method
# create variable to hold calculated interest
# return the interest that was calculated
