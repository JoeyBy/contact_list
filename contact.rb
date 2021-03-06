require 'pry'

class Contact
 
  attr_accessor :name, :email, :id, :phone_number

  @@contacts_database = []

  def initialize(name, email, phone_number, id)
    @name = name.downcase
    @email = email.downcase
    @phone_number = phone_number
    @id = id
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@id}, #{@name}, #{@email}, #{@phone_number}"
  end

  def to_a
    [@id, @name, @email, @phone_number]
  end

  ## Class Methods

    def self.populate_list
      @id = 1
      contacts = []
      ContactDatabase.get_raw_data.each do |row|
        if row[1] != nil && row[2] != nil
          contacts << Contact.new(row[1], row[2], row[3], @id)
          @id += 1
        end
      end
      return contacts
    end

    def self.create(name, email, phone_number)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      @@contacts_database = Contact.populate_list
      @@contacts_database << Contact.new(name, email, phone_number, @@contacts_database.length + 1 )
      ContactDatabase.rewrite_csv(@@contacts_database)    

    end
 
    def self.find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      @@contacts_database = Contact.populate_list
      @@contacts_database.each do |contact|
        # puts contact.to_s
        if contact.to_s.include?(term)
          return contact.to_s
        end
      end
    end
 
    def self.all
      # TODO: Return the list of contacts, as is
      @@contacts_database = Contact.populate_list
      @@contacts_database.each_with_index do |contact,index|
        puts "#{index}: #{contact.name} (#{contact.email}) #{contact.phone_number}"
      end

      # ContactDatabase.get_raw_data
      # @@contacts_database
    end
    
    def self.show(id)
      # TODO: Show a contact, based on ID
      @@contacts_database = Contact.populate_list
      @@contacts_database.detect do |contact|
        contact.id == id
      end
    end    

end