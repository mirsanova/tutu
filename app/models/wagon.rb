class Wagon < ActiveRecord::Base
  TYPES_WAGON = ["Купейный", "Плацкартный"]
  validates :number, :type_wagon, :top_seats_count, :bottom_seats_count, presence: true

  belongs_to :train
end