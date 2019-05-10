class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.text :body
      t.references :user, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
