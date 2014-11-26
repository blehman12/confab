class AddPriorityToWants < ActiveRecord::Migration
  def change
    add_column :wants, :priority, :integer
  end
end
