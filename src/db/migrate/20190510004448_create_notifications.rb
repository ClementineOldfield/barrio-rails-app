class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :notificationable, polymorphic: true, index: {:name => "notification_short_name"}
      t.boolean :read
      t.references :user, foreign_key: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
