require_relative 'contact'

def display(input)
  input.each do |x|
    puts "NAME: #{x.firstname} #{x.lastname}"
    puts "EMAIL: #{x.email}"
    puts "ID: #{x.id}"
    puts "-------------------"
  end
end

case ARGV[0] 

when 'help'
  puts "Here is a list of available commands:"
  puts "new  - Create a new contact"
  puts "list - List all contacts"
  puts "find-id - Finds a contact by ID"
  puts "find-last - finds a contact by their last name"
  puts "find-first - finds a contact by their first name"
  puts "find-email - find a contact by their email"


when 'new'
  puts "Enter their first name"
  firstname = STDIN.gets.chomp
  puts "Enter their last name"
  lastname = STDIN.gets.chomp
  puts "Enter their email address"
  email = STDIN.gets.chomp
  Contact.create(firstname: firstname,lastname: lastname,email: email)
  puts "Contact created!"

when 'list'
  puts "List all contacts"
  display(Contact.all)

when 'find-id'
  id = ARGV[1]
  display(Contact.find(id))

when 'find-last'
  term = ARGV[1]
  display(Contact.find_all_by_lastname(term))

when 'find-first'
  term = ARGV[1]
  display(Contact.find_all_by_firstname(term))

when 'find-email'
  term = ARGV[1]
  display(Contact.find_all_by_email(term))

else
  puts "I don't understand."

end
