class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :details
      t.text :category, array: true, default: []
      t.integer :quantity
      t.decimal :price
      t.decimal :virtual_cash, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
