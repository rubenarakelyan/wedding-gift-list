class AddTransactionIdToPurchasedGifts < ActiveRecord::Migration[5.1]
  def change
    add_column :purchased_gifts, :transaction_id, :uuid
    add_index :purchased_gifts, :transaction_id
  end
end
