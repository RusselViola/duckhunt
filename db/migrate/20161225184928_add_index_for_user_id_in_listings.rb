class AddIndexForUserIdInListings < ActiveRecord::Migration[5.0]
  def change
    add_index :listings, :user_id
  end
end
