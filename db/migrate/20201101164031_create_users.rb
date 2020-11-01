class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :phone
      t.integer :role
      t.string :address
      t.timestamps
    end
  end
end
