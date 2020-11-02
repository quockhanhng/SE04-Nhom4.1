class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.float :total_amount
      t.integer :status
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
