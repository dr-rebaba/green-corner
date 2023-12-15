class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_column :users, :total_virtual_cash, :float
    add_column :users, :is_seller, :boolean
  end
end
