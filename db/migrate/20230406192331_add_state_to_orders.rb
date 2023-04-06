class AddStateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :state, :string
    add_index :orders, :state
  end
end
