class RemoveRecipientFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :recipient, :string
  end
end
