# load 'contact.rb'
# require './contact' #also used for existing ruby libraries, files that already exist as part of ruby?
    #or require_relative 'contact' ##recomended

require_relative 'contact'
require_relative 'rolodex'



Class CRM
    def self.run  #class methods always have self, instance methods never dp
        my_crm = CRM.new
        my_crm.main_menu
    end

    def initialize
        @rolodex = Rolodex.new
    end

    def print_main_menu
        puts "[1] Add new contact"
        puts "[2] Modify an existing contact"
        puts "[3] Delete a contact"
        puts "[4] Display a contacts"
        puts "[5] Display all contacts"
        puts "[6] Display an atribute"
        puts "[7] Exit"
        puts "Enter a selection"
    end

    def modify_menu
        puts "[1] Modify First Name"
        puts "[2] Modify Last Name"
        puts "[3] Modify Email"
        puts "[4] Modify Note"
        puts "Enter a selection"

        num = gets.chomp.to_i

        puts "Enter new info"

        new_info = gets.chomp

        contact.first_name = new_info is num == 1
        contact.last_name = new_info is num == 2
        contact.email = new_info is num == 3
        contact.note = new_info is num == 4

        puts contact.to_s
        main_menu
    end

    def call_selection(selection)
        add_new_contact if selection == 1 #inline if statements, one line, reads condition once, keep short like a method call so its easier to read
        modify_contact if selelection == 2
        delete_contact if selection == 3
        display_contact if selection == 4
        display_all_contacts if selection == 5
        display_an_atrribute if selection == 6
        exit if selection == 7
    end

    def main_menu
        while true
            print_main_menu
            selection = gets.chomp.to_i
            call_selection(selection)
        end
    end

    def add_new_contact
        print "First name: "
        first_name = gets.chomp
        print "Last name: "
        last_name = gets.chomp
        print "Email: "
        email = gets.chomp
        print "Note: "
        note = gets.chomp
        rolodex.add(contact)
        contact = Contact.new(first_name, last_name, email, note)
        #hash is not a good choice, create a whole object that can have state and behaviour, and therefore this will give more power
    end

    def modify_contact
        print "Enter contact_id of the contact you would like to modify"
        contact = @rolodex.find(contact_id)
        print "Are you sure you want to modify contact: #{contact_id}?"
        answer = gets.chomp.downcanse
        modify_menu if answer == yes
    end

    def delete_contact
        print "Enter contact_id of the contact you would like to delete"
        contact_id = gets.chomp.to_i
        contact = @rolodex.find(contact_id)
        puts "Are you sure you want to delete this contact?"
        answer = gets.chomp.downcanse
        rolodex.delete_contact(contact) if answer == "yes"
        puts "Contact #{contact_id} has been deleted"
        main_menu
    end

    def display_contact
        print "Enter id of user you would like to view: "
        contact_id = gets.chomp.to_i
        contact = @rolodex.find(contact_id)
        puts contact #print contact.to_s
        main_menu
    end

    def display_all_contacts
        @rolodex.display_all_contacts
    end

    def display_an_attribute
        Print "Enter id of contact you would like to view"
        contact_id = gets.chomp.to_i
        contact = @rolodex.find(contact_id)
        Print "Enter (#) of which attribute you would like to view. 1-First Name, 2-Last Name, 3-Email, 4-Note"
        field_num = gets.chomp.to_i
        puts contact.first_name if field_num == 1
        puts contact.last_name if field_num == 2
        puts contact.email if field_num == 3
        puts contact.note if field_num == 4
    end
end
CRM.run