class Train < ActiveRecord::Base
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  def compartment_wagon_count
    self.wagons.select{ |wagon| wagon.type_wagon == 'Купейный'}.size
  end

  def econom_wagon_count
    self.wagons.select{ |wagon| wagon.type_wagon == 'Плацкартный'}.size
  end

  def seats_count
    compartment_bottom_seats_count = 0
    compartment_top_seats_count = 0
    econom_top_seats_count = 0
    econom_bottom_seats_count = 0

    self.wagons.each do |wagon|
      if wagon.type_wagon == 'Купейный'
        compartment_bottom_seats_count += wagon.bottom_seats_count
        compartment_top_seats_count += wagon.top_seats_count
      else
        econom_top_seats_count += wagon.bottom_seats_count
        econom_bottom_seats_count += wagon.top_seats_count
      end
    end

    return compartment_bottom_seats_count,
           compartment_top_seats_count,
           econom_top_seats_count,
           econom_bottom_seats_count

  end
end