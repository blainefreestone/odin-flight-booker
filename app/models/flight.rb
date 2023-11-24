class Flight < ApplicationRecord
  validates :departure_airport, :arrival_airport, :start_datetime, :duration_minutes, presence: true
  validates :departure_airport, comparison: { other_than: :arrival_airport }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
end
