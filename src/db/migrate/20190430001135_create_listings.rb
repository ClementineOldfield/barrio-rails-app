class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.integer :price
      t.references :category, foreign_key: true
      t.integer :quantity
      t.boolean :is_available

      t.timestamps
    end
  end
end
