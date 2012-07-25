require 'gtk2'

module Notepad
  class MainWindow < Gtk::Window
    def initialize
        super
    
        set_title "Image menu"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        set_window_position Gtk::Window::POS_CENTER
        
        show_all
    end
    
    def init_ui
        mb = Gtk::MenuBar.new

        filemenu = Gtk::Menu.new
        filem = Gtk::MenuItem.new "File"
        filem.set_submenu filemenu
        
        agr = Gtk::AccelGroup.new
        add_accel_group agr

        newi = Gtk::ImageMenuItem.new Gtk::Stock::NEW, agr
        key, mod = Gtk::Accelerator.parse "N"
        newi.add_accelerator("activate", agr, key, 
            mod, Gtk::ACCEL_VISIBLE)
        filemenu.append newi

        openm = Gtk::ImageMenuItem.new Gtk::Stock::OPEN, agr
        key, mod = Gtk::Accelerator.parse "O"
        openm.add_accelerator("activate", agr, key, 
            mod, Gtk::ACCEL_VISIBLE)
        filemenu.append openm

        sep = Gtk::SeparatorMenuItem.new
        filemenu.append sep

        exit = Gtk::ImageMenuItem.new Gtk::Stock::QUIT, agr
        key, mod = Gtk::Accelerator.parse "Q"
        exit.add_accelerator("activate", agr, key, 
            mod, Gtk::ACCEL_VISIBLE)

        exit.signal_connect "activate" do
            Gtk.main_quit
        end
        filemenu.append exit

        mb.append filem

        #Note table

        table_vbox = Gtk::VBox.new false, 5
        table_hbox = Gtk::HBox.new false, 5

        treestore = Gtk::TreeStore.new(String, Integer)

        parent = treestore.append(nil)
        parent[0] = "A note is a very long string of text."
        parent[1] = 1962
        parent = treestore.append(nil)
        parent[0] = "Notes can be really long and may screw up the formatting of these columns."
        parent[1] = 1962

        view = Gtk::TreeView.new(treestore)
        view.selection.mode = Gtk::SELECTION_SINGLE
        renderer = Gtk::CellRendererText.new
        col = Gtk::TreeViewColumn.new("Note", renderer, :text => 0)
        view.append_column(col)
        renderer = Gtk::CellRendererText.new
        col = Gtk::TreeViewColumn.new("Time", renderer)
        view.append_column(col)
        col.set_cell_data_func(renderer) do |col, renderer, model, iter|
          renderer.text = Time.at(iter[1]).to_s
        end
        table_vbox.pack_start view, false, false, 10
        table_hbox.pack_start table_vbox, false, false, 7

        #Main vbox

        parent_vbox = Gtk::VBox.new false, 2
        parent_vbox.pack_start mb, false, false, 0
        parent_vbox.pack_start table_hbox, false, false, 0

        add parent_vbox
    end
  end
end
