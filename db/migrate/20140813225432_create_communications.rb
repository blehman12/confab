class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :excomm
      t.string :userinfo
      t.integer :user_id

      t.timestamps
    end
    add_index :communications, [:user_id, :created_at]
  end
end
