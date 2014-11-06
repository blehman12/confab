class CreateMessageables < ActiveRecord::Migration
  def change
    create_table :messageables do |t|

      t.timestamps
    end
  end
end
