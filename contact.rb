require 'pry'
require 'pg'

class Contact < ActiveRecord::Base


  def connection 
    PG.connect(host: 'localhost',
    dbname: 'contact_list',
    user: 'development',
    password: 'development')
  end


end