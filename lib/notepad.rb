module Notepad
  
  VERSION = '0.0.0'
  
  #For some reason, normal require/autoload doesn't work on my windows box.
  CURRENT_DIR = File.expand_path(File.dirname(__FILE__))
  require "#{CURRENT_DIR}/notepad/main_window.rb"

  Gtk.init
  main_window = Notepad::MainWindow.new
  Gtk.main

end
