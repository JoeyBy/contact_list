require_relative 'contact'
require_relative 'contact_database'
# require 'csv'

joey = Contact.create("joey dude","asbcdasf@gmail.com")
bob = Contact.create("bob johnson", "12345@hotmail.com")
susan = Contact.create("Susan broseph", "fishsifh@gmail.com")


# puts bob

puts Contact.all

puts Contact.show(3)


# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
# user = ARGV.first
# prompt = '~ '

# puts "Welcome to Joey's awesome contact app..."
# puts "Enter your input..."
# print prompt
# commands = STDIN.gets.chomp.downcase

# case commands

# when 'help'
#   puts "Here is a list of available commands:"
#   puts "     new - Create a new contact"
#   puts "     list - List all contacts"
#   puts "     show - Show a contact"
#   puts "     find - Find a contact"

# when 'new'
#   puts "You want to create a contact"
#   Contact.create
# when 'list'
#   puts "You want to list all contacts"

# when 'show'
#   puts "You want to show a specific contact"

# when 'find'
#   puts "You want to find a contact"

# else
#   puts "I don't understand..."

# end


# puts "What kind of computer do you have?"
# print prompt
# computer = STDIN.gets.chomp

# puts <<MESSAGE
# Alright, so you said #{likes} about liking me.
# You live in #{lives}.  Not sure where that is.
# And you have a #{computer} computer.  Nice.
# MESSAGE

# customers = CSV.read('database.csv')
# # puts customers

# puts customers


# test_arr = CSV.foreach('database.csv') do |row|
#   puts row.inspect
# end

# test_arr