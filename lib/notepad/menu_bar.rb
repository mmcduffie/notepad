module Notepad
  class MenuBar < Gtk::MenuBar
    def initialize(agr)
      super()
      filemenu = Gtk::Menu.new
      filem = Gtk::MenuItem.new "File"
      filem.set_submenu filemenu

      newi = Gtk::ImageMenuItem.new Gtk::Stock::NEW, agr
      key, mod = Gtk::Accelerator.parse "N"
      newi.add_accelerator("activate", agr, key, mod, Gtk::ACCEL_VISIBLE)
      filemenu.append newi

      openm = Gtk::ImageMenuItem.new Gtk::Stock::OPEN, agr
      key, mod = Gtk::Accelerator.parse "O"
      openm.add_accelerator("activate", agr, key, mod, Gtk::ACCEL_VISIBLE)
      filemenu.append openm

      sep = Gtk::SeparatorMenuItem.new
      filemenu.append sep

      exit = Gtk::ImageMenuItem.new Gtk::Stock::QUIT, agr
      key, mod = Gtk::Accelerator.parse "Q"
      exit.add_accelerator("activate", agr, key, mod, Gtk::ACCEL_VISIBLE)

      exit.signal_connect "activate" do
        Gtk.main_quit
      end
      filemenu.append exit

      append filem
    end
  end
end
