module Bank
  class Owner
    attr_accessor :first_name, :last_name, :street_number, :extra_line, :street_name, :city, :state, :zip, :phone

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street_number = owner_hash[:street_number]
      @extra_line = owner_hash[:extra_line]
      @street_name = owner_hash[:street_name]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
      @phone = owner_hash[:phone]
    end
  end
end
