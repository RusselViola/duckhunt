class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps
    end
    add_index :orders, :city
    add_index :orders, :state
  end
end
