require 'sqlite3'

module Notepad
  class Note
    attr_accessor :id
    attr_accessor :note
    attr_accessor :date
    def save
      begin
        db = SQLite3::Database.open "../../../db/notepad.db"
        db.execute "INSERT INTO Notes VALUES(NULL,#{@note},#{Time.now.to_i})"
      rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
      ensure
        db.close if db
      end
    end
  end
end

note = Notepad::Note.new
note.note = "foo"
note.save
