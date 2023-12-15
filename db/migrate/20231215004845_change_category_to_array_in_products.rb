class ChangeCategoryToArrayInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :category, :integer, array: true, default: []
  end
end
