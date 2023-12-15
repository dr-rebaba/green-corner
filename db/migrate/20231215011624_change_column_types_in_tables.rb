class ChangeColumnTypesInTables < ActiveRecord::Migration[7.0]
  def change
    change_table :cart_products do |t|
      t.change :price, :decimal, precision: 10, scale: 2
      t.change :virtual_cash, :decimal, precision: 10, scale: 2
    end

    change_table :orders do |t|
      t.change :amount, :decimal, precision: 10, scale: 2
      t.change :virtual_cash, :decimal, precision: 10, scale: 2
    end

    change_table :order_products do |t|
      t.change :price, :decimal, precision: 10, scale: 2
    end
  end
end
