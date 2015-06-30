## TODO: Implement CSV reading/writing
require 'csv'

class DataBase


def write_contact(input)
  somefile = File.open('contacts.csv', 'w')
  somefile.puts "#{input}"
  somefile.close
end
end

# new_contact


# def read_contact
#   CSV.foreach('contacts.csv','r') do |row|
#     @@contact_database << row.inspect
#   end

# end
