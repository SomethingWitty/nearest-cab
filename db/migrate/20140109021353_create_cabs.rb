class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
