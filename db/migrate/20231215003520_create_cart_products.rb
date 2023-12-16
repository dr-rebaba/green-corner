class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.decimal :virtual_cash

      t.timestamps
    end
  end
end
