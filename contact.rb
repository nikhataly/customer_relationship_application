class Contact
    attr_accessor :first_name, :last_name, :email, :note

    def initialize(first_name, last_name, email, note)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @note = note
    end

    def to_s
        print "First name: #{@first_name}, Last_name: #{@last_name}, Email: #{@email}, Notes: #{@note}"
end