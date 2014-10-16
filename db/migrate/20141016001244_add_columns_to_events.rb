class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :state, :string
    add_column :events, :zipcode, :string
    add_column :events, :city, :string
  end
end
