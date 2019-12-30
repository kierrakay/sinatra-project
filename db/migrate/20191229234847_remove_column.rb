class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :time, :date
  end
end
