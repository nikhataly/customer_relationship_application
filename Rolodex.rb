Class Rolodex
    def initialize
        @contacts = []
        @id = 1
    end

    def add(contact)
        contact.id = @id
        @contacts << contact
        @id += 1
    end

    def find(contact_id)
        @contacts.find do |contact| #instead of .select
            contact.id == contact_id
        end
    end

    def delete_contact(contact)
        @contacts.delete(contact)
    end

    def display_all_contacts
        puts @contacts
    end

end