module Notepad
  class NoteTable < Gtk::HBox
    def initialize
      super()
      table_vbox = Gtk::VBox.new false, 5
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

      pack_start table_vbox, false, false, 7
    end
  end
end
