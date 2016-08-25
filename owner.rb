require 'csv'

module Bank
  class Owner
    attr_accessor :id, :last_name, :first_name, :street_address, :city, :state

    def initialize(owner_hash)
      @id = owner_hash[:id]
      @last_name = owner_hash[:last_name]
      @first_name = owner_hash[:first_name]
      @street_address = owner_hash[:street_address]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
    end

    def self.all
    accounts = []
      CSV.read("./support/owners.csv").each do |line|
        account = {} #create empty hash to store this CSV line's data

        account[:id] = line[0].to_i
        account[:last_name] = line[1]
        account[:first_name] = line[2]
        account[:street_address] = line[3]
        account[:city] = line[4]
        account[:state] = line[5]

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
  end
end

#TEST self.all method
# c = Bank::Owner.all
# puts c

#TEST self.find method
# b = Bank::Owner.find(17)
# puts b
# puts b.id
# puts b.first_name
# puts b.last_name
# puts b.state
