class CreateRecyclePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :recycle_points do |t|
      t.string :name
      t.text :category, array: true, default: []
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
