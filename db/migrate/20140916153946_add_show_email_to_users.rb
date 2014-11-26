class AddShowEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_email, :integer, default: 0
  end
end
