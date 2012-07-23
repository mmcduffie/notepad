#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.open "notepad.db"
    db.execute "CREATE TABLE IF NOT EXISTS Notepad(Id INTEGER PRIMARY KEY, 
        Note TEXT, Date INT)"
    
rescue SQLite3::Exception => e 
    
    puts "Exception occured"
    puts e
    
ensure
    db.close if db
end
