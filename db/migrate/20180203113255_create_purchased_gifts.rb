class CreatePurchasedGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :purchased_gifts do |t|
      t.belongs_to :gift, index: true
      t.belongs_to :guest, index: true
      t.integer :paid
      t.text :message

      t.timestamps
    end
  end
end
