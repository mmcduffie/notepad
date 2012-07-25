module Notepad
  class Note
    attr_accessor :id
    attr_accessor :note
    attr_accessor :date
    def save
      begin
        time = Time.now.to_i
        db = SQLite3::Database.open DB_PATH
        db.execute "INSERT INTO Notes VALUES(NULL,'#{@note}',#{time})"
        @id = db.last_insert_row_id
        @date = time
      rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
      ensure
        db.close if db
      end
      if @id
        return self
      else
        return false
      end
    end
  end
end
