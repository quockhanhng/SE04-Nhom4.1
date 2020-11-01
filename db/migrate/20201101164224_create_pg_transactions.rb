class CreatePgTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :pg_transactions do |t|
      t.integer :status
      t.string :charge_id
      t.float :charge_amount
      t.integer :payment_type
      t.integer :total_delivery_fee
      t.references :cart, foreign_key: true
      t.timestamps
    end
  end
end
