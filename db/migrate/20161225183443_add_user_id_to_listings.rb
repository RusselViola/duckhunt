class AddUserIdToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :user_id, :integer, null: false
  end
end
