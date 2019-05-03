class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.string :stripe_session_id

      t.timestamps
    end
  end
end
