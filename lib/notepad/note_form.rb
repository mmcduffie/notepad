module Notepad
  class NoteForm < Gtk::HBox
    def initialize
      super()

      table_vbox = Gtk::VBox.new false, 5
     
      textview = Gtk::TextView.new
      font = Pango::FontDescription.new("Monospace Bold 10")
      textview.modify_font(font)
      textview.wrap_mode = Gtk::TextTag::WRAP_WORD
      textview.editable =  true
      textview.cursor_visible =  true
      textview.pixels_above_lines = 5
      textview.pixels_below_lines = 5
      textview.pixels_inside_wrap = 5
      textview.left_margin = 8
      textview.right_margin = 8
      textview.set_width_request(518)
      textview.set_height_request(162)

      signal_connect("expose_event") do |w,e|
        if Notepad.selected_row
          note = Notepad.notes.find(Notepad.selected_row).note
          textview.buffer.text = note
        end
      end

      scrolled_win = Gtk::ScrolledWindow.new
      scrolled_win.border_width = 5
      scrolled_win.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)
      scrolled_win.add(textview)

      table_vbox.pack_start scrolled_win, false, false, 10

      pack_start table_vbox, false, false, 7
    end
  end
end
