class AddAdminToUsers < ActiveRecord::Migration[8.2]
  def change
    add_column :users, :admin, :boolean
  end
end
