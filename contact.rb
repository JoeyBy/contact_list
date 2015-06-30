require 'csv'


class Contact
  attr_accessor :name, :email, :id
  @@contact_data = []
 
  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @id = @@contact_data.length + 1
  end

 
  def to_s
    # TODO: return string representation of Contact
    "#{@id}, #{@name}, #{@email}"
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = Contact.new(name, email)      
      @@contact_data << contact

      @@contact_data.last

    end

    # def get_next_id
    #   @id = @@contact_data.length + 1
    # end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@contact_data.each do |word|
        word.to_s
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      @@contact_data.detect do |word|
        word.id == id
      end
    end
  end
 end