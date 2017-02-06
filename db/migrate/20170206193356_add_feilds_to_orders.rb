class AddFeildsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :buyer_id, :integer, null: false
    add_column :orders, :seller_id, :integer, null: false
  end
end
