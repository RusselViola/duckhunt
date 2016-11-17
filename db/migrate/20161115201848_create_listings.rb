class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
