class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string :type_wagon
      t.integer :top_seats_count
      t.integer :bottom_seats_count

      t.timestamps
    end
  end
end
