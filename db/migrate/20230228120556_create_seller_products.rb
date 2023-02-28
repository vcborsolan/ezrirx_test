class CreateSellerProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :seller_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
