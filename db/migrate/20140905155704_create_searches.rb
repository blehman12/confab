class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :users
      t.string :wants
      t.string :skills

      t.timestamps
    end
  end
end
