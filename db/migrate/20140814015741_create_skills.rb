class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.string :skill
      t.integer :level
      t.string :tag
      t.string :category

      t.timestamps
    end
    add_index :skills, [:user_id, :created_at]
  end
end
