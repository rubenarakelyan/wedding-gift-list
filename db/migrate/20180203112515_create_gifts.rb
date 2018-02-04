class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
