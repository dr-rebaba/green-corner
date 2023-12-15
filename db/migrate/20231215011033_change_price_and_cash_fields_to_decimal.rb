class ChangePriceAndCashFieldsToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2
    change_column :products, :virtual_cash, :decimal, precision: 10, scale: 2

    change_column :users, :total_virtual_cash, :decimal, precision: 10, scale: 2
  end
end
