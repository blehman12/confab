class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :theme

      t.timestamps
    end
  end
end
