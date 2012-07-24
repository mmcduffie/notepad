module Notepad
  
  # Global Constants
  VERSION = '0.0.0'
  DB_PATH = "#{File.expand_path(File.dirname(__FILE__))}/db/notepad.db"
  
  # Requires
  require 'sqlite3'
  require_relative 'notepad/main_window.rb'
  require_relative 'notepad/note.rb'
  
  # Main Code

  note = Notepad::Note.new
  note.note = "foo"
  note.save

  #Gtk.init
  #main_window = Notepad::MainWindow.new
  #Gtk.main
end
