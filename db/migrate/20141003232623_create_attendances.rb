class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      #user id
      t.integer :attendee_id
      #event id
      t.integer :attended_id

      t.timestamps
    end

    add_index :attendances, :attendee_id
    add_index :attendances, :attended_id
    add_index :attendances, [:attendee_id, :attended_id], unique: true
  end
end
