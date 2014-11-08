class ChangeDataTypeForEventDescription < ActiveRecord::Migration
  def change
    change_table :events do |t|  
      t.change :description, :text 
    end
  end
end
