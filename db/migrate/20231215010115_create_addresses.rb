class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :details
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
