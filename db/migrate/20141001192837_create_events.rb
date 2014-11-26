class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start
      t.date :stop
      t.string :location
      t.string :address
      t.string :recurrence
      t.string :user
      t.integer :user_id
      t.string :contact
      t.string :theme
      t.string :category
      t.string :subcategoryA
      t.string :subcategoryB
      t.string :subcategoryC
      
      t.timestamps
    end
      add_index :events, [:user_id, :created_at]
  end
end
