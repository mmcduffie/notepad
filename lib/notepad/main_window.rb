module Notepad
  class MainWindow < Gtk::Window
    def initialize
        super
    
        set_title "Notepad"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        set_window_position Gtk::Window::POS_CENTER
        
        show_all
    end
    
    def init_ui

        note_table = Notepad::NoteTable.new

        menu_bar = Notepad::MenuBar.new self

        parent_vbox = Gtk::VBox.new false, 2
        parent_vbox.pack_start menu_bar, false, false, 0
        parent_vbox.pack_start note_table, false, false, 0

        add parent_vbox
    end
  end
end
