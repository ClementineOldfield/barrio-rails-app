class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :street_1
      t.string :street_2
      t.string :suburb
      t.integer :state
      t.integer :postcode

      t.timestamps
    end
  end
end
