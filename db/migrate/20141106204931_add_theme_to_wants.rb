class AddThemeToWants < ActiveRecord::Migration
  def change
    add_column :wants, :theme, :string
  end
end
