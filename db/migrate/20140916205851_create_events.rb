class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :recurrence
      t.date :start
      t.date :stop
      t.string :location
      t.string :address
      t.string :owner
      t.string :contact
      t.integer :theme

      t.timestamps
    end
  end
end
