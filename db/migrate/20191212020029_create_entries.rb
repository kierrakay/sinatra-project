class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :author 
      t.string :mood
      t.string :body
    end
  end
end
