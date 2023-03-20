class AddUserAdminParam < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :distributor, :boolean, default: false
  end
end
