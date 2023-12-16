class ChangeNameColumnTypeInRecyclePoints < ActiveRecord::Migration[7.0]
  def change
    change_column :recycle_points, :name, :string
  end
end
