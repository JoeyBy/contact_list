require_relative 'contact'
require 'pry'

def display(input)
    puts "NAME: #{input.firstname} #{input.lastname}"
    puts "EMAIL: #{input.email}"
    puts "ID: #{input.id}"
    puts "-------------------"
end

case ARGV[0]
  when 'help'
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    puts "Here is a list of available commands:"
    puts "new  -       create a new contact"
    puts "list -       list all contacts"
    puts "find-id -    finds a contact by ID"
    puts "find-last -  finds a contact by their last name"
    puts "find-first - finds a contact by their first name"
    puts "find-email - find a contact by their email"
    puts "delete -     delete a contact by their ID number"
  when 'new'
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    puts "Enter their first name"
    firstname = STDIN.gets.chomp
    puts "What is #{firstname}'s last name?"
    lastname = STDIN.gets.chomp
    puts "What is #{firstname} #{lastname}'s' email address?"
    email = STDIN.gets.chomp
    Contact.create(firstname: firstname,lastname: lastname,email: email)
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    puts "#{firstname} #{lastname} has been added to your address book!"
  when 'list'
    puts "ALL CONTACTS"
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    all_cont = Contact.all
    all_cont.each do |word|
      display(word)
    end
  when 'find-id'
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    id = ARGV[1]
    display(Contact.find(id))
  when 'find-last'
    puts"- - - - - - - - - - - - - - - - - - - - - -"
    term = ARGV[1]
    display(Contact.find_by lastname: term)
  when 'find-first'
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    term = ARGV[1]
    display(Contact.find_by firstname: term)
  when 'find-email'
    puts "- - - - - - - - - - - - - - - - - - - - - -"
    term = ARGV[1]
    display(Contact.find_by email: term)
  when 'delete'
    id = ARGV[1]
    dead = Contact.find(id)
    dead.destroy
    puts "contact with ID # #{id} has been deleted"
  else
    puts "I don't understand."

end
