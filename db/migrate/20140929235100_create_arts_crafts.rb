class CreateArtsCrafts < ActiveRecord::Migration
  def change
    create_table :arts_crafts do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
