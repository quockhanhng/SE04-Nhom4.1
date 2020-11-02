class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.integer :parent_id
      t.string :slug
      t.timestamps
    end
  end
end
