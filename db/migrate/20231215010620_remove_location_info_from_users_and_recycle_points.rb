class RemoveLocationInfoFromUsersAndRecyclePoints < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
    remove_column :users, :address, :string

    remove_column :recycle_points, :latitude, :float
    remove_column :recycle_points, :longitude, :float
    remove_column :recycle_points, :address, :string
  end
end
