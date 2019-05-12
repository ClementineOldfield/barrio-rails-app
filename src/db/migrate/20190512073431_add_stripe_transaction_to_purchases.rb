class AddStripeTransactionToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :stripe_transaction_id, :integer
  end
end
