class AddColumnsToWants < ActiveRecord::Migration
  def change
    add_column :wants, :theme_id, :integer
    add_column :wants, :category_id, :integer
  end
end
