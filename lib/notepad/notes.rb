module Notepad
  class Notes
    def show_all
      result = []
      all_notes = []
      begin
        db = SQLite3::Database.open DB_PATH
        result = db.execute "SELECT * FROM Notes"
      rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
      ensure
        db.close if db
      end
      result.each do |note|
        new_note = Notepad::Note.new
        new_note.id = note[0]
        new_note.note = note[1]
        new_note.date = note[2]
        all_notes.push new_note
      end
      return all_notes
    end
    def find(id)
      begin
        db = SQLite3::Database.open DB_PATH
        result = db.execute "SELECT * FROM Notes WHERE Id=#{id}"
      rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
      ensure
        db.close if db
      end
      output = Notepad::Note.new
      output.id = result[0]
      output.note = result[1]
      output.date = result[2]
      if output.id
        return output
      else
        return false
      end
    end
  end
end
