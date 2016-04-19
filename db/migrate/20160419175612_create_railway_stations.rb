class CreateRailwayStations < ActiveRecord::Migration
  def change
    create_table :railway_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
