class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :is_available, :active
  end
end
