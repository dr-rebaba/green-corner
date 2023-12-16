class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :total_virtual_cash, :decimal, precision: 10, scale: 2
    add_column :users, :is_seller, :boolean
  end
end
