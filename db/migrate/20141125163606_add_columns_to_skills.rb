class AddColumnsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :theme_id, :integer
    add_column :skills, :category_id, :integer
  end
end
