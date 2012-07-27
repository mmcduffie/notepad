module Notepad
  
  # Global Constants
  VERSION = '0.0.0'
  DB_PATH = "#{File.expand_path(File.dirname(__FILE__))}/db/notepad.db"
  
  # Requires
  require 'sqlite3'
  require 'gtk2'
  require_relative 'notepad/main_window.rb'
  require_relative 'notepad/note_table.rb'
  require_relative 'notepad/menu_bar.rb'
  require_relative 'notepad/note.rb'
  require_relative 'notepad/notes.rb'
  
  # Main Code

  #note = Notepad::Note.new
  #note.note = "This is a really long note because I am crazy"
  #note.save
  
  #notes = Notepad::Notes.new
  #puts notes.find(67).inspect

  #notes = Notepad::Notes.new
  #puts notes.show_all.inspect

  Gtk.init
  main_window = Notepad::MainWindow.new
  Gtk.main
end
