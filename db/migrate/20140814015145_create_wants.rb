class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.integer :user_id
      t.string :wanted
      t.string :tag
      t.string :category

      t.timestamps
    end
    add_index :wants, [:user_id, :created_at]
  end
end
