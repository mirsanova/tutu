class AddStationsToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :arrival_station
    add_belongs_to :tickets, :departure_station
  end
end
