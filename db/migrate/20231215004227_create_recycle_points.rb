class CreateRecyclePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :recycle_points do |t|
      t.integer :type
      t.string :address
      t.integer :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
