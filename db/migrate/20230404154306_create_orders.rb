class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint    :number, null: false
      t.string    :phone, null: false
      t.string    :area
      t.string    :adress
      t.datetime  :delivery_time_start
      t.datetime  :delivery_time_end
      t.text      :description, null: false
      t.text      :comment
      t.bigint    :creator_id, null: false
      t.bigint    :delivery_person_id

      t.timestamps
    end

    add_index :orders, :number, unique: true
    add_index :orders, :creator_id
    add_index :orders, :delivery_person_id
  end
end
