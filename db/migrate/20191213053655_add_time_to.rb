class AddTimeTo < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :time, :date
  end
end
