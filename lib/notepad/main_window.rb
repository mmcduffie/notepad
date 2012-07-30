module Notepad
  class MainWindow < Gtk::Window
    attr_accessor :notes
    attr_accessor :selected_row
    def initialize
        super
    
        set_title "Notepad"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        @notes = Notepad::Notes.new

        init_ui

        set_default_size 250, 200
        set_window_position Gtk::Window::POS_CENTER
        
        show_all
    end
    
    def init_ui
        notebook   = Gtk::Notebook.new
        
        note_table = Notepad::NoteTable.new self
        note_form  = Notepad::NoteForm.new  self
        menu_bar   = Notepad::MenuBar.new   self

        notebook.append_page note_table, Gtk::Label.new("Notes")
        notebook.append_page note_form, Gtk::Label.new("Edit Note")

        parent_vbox = Gtk::VBox.new false, 2
        parent_vbox.pack_start menu_bar, false, false, 0
        parent_vbox.pack_start notebook, false, false, 0

        add parent_vbox
    end
  end
end
