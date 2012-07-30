module Notepad
  
  # Global Constants
  VERSION = '0.0.0'
  DB_PATH = "#{File.expand_path(File.dirname(__FILE__))}/db/notepad.db"

  # Requires
  require 'sqlite3'
  require 'gtk2'
  require_relative 'notepad/main_window.rb'
  require_relative 'notepad/note_table.rb'
  require_relative 'notepad/note_form.rb'
  require_relative 'notepad/menu_bar.rb'
  require_relative 'notepad/note.rb'
  require_relative 'notepad/notes.rb'
  
  # Main Code

  #@selected_row = nil
  #def self.selected_row
  #  @selected_row
  #end
  #def self.selected_row=(id)
  #  @selected_row = id
  #end

  #@notes = Notepad::Notes.new
  #def self.notes
  #  @notes
  #end

  Gtk.init
  main_window = Notepad::MainWindow.new
  Gtk.main
end
