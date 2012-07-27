module Notepad
  class NoteTable < Gtk::HBox
    def initialize
      super()
      table_vbox = Gtk::VBox.new false, 5
      treestore = Gtk::TreeStore.new(String, Integer)

      notes = Notepad::Notes.new.show_all

      notes.each do |note|
        parent = treestore.append(nil)
        parent[0] = note.note
        parent[1] = note.date
      end

      view = Gtk::TreeView.new(treestore)
      view.selection.mode = Gtk::SELECTION_SINGLE
      renderer = Gtk::CellRendererText.new
      renderer.width = 400
      renderer.ellipsize = Pango::ELLIPSIZE_END
      col = Gtk::TreeViewColumn.new("Note", renderer, :text => 0)
      view.append_column(col)
      renderer = Gtk::CellRendererText.new
      col = Gtk::TreeViewColumn.new("Time", renderer)
      view.append_column(col)
      col.set_cell_data_func(renderer) do |col, renderer, model, iter|
        time = Time.at(iter[1])
        renderer.text = time.strftime("%m/%d/%Y %I:%M%p")
      end
      table_vbox.pack_start view, false, false, 10

      pack_start table_vbox, false, false, 7
    end
  end
end
