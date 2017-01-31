class AddZipcodeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :zipcode, :string, null: false
    add_index :orders, :zipcode
  end
end
