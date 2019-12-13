class AddTitleToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :title, :string
  end
end
