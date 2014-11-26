class RemoveThemeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :theme, :string
  end
end
