class CreateTransportations < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
