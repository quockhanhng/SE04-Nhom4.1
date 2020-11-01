class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.float :amount
      t.integer :quantity
      t.float :price
      t.integer :delivery_fee
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
