require 'pry'
require 'pg'

class Contact
 
  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(firstname, lastname, email, id=nil)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
  end

  def save
    sql = "INSERT INTO contacts(firstname, lastname, email)
    VALUES ($1, $2, $3)"
    self.class.connection.exec_params(sql, [@firstname, @lastname, @email])
    puts "#{@firstname} #{@lastname} with an email #{@email} has been added"
  end

class << self

  def connection 
    PG.connect(host: 'localhost',
    dbname: 'contact_list',
    user: 'development',
    password: 'development')
  end

  def all
    pg_contact = []
    var = connection.exec( "SELECT * FROM contacts" )
      var.each do |row|
        pg_contact << self.new(
        row["firstname"],
        row["lastname"],
        row["email"],
        row["id"])
      end
    pg_contact
  end

  def destroy(person)
    sql = "DELETE FROM contacts WHERE id = ($1)"
    connection.exec_params(sql, [person])
  end

  def find(contact_id)
    sql = "SELECT * FROM contacts WHERE id = ($1)"
    result = connection.exec_params(sql, [contact_id])
    master_of_disaster(result)
  end

  def find_all_by_lastname(contact_last)
    sql = "SELECT * FROM contacts WHERE lastname = ($1)"
    result = connection.exec_params(sql, [contact_last])
    master_of_disaster(result)
  end

  def find_all_by_firstname(contact_first)
    sql = "SELECT * FROM contacts WHERE firstname = ($1)"
    result = connection.exec_params(sql, [contact_first])
    master_of_disaster(result)
  end

  def find_all_by_email(contact_email)
    sql = "SELECT * FROM contacts WHERE email = ($1)"
    result = connection.exec_params(sql, [contact_email])
    master_of_disaster(result)
  end

  def master_of_disaster(param)
    pg_contact = []
    param.each do |row|
    pg_contact << self.new(
      row["firstname"],
      row["lastname"],
      row["email"],
      row["id"])
    end
  pg_contact
  end


end
end

# Contact.all

