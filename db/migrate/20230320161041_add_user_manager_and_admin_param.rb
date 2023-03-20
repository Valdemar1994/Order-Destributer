class AddUserManagerAndAdminParam < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :manager, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
