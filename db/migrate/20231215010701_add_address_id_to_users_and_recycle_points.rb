class AddAddressIdToUsersAndRecyclePoints < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address, foreign_key: true
    add_reference :recycle_points, :address, foreign_key: true
  end
end
