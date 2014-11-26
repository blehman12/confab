class AddThemeToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :theme, :string
  end
end
