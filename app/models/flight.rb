class Flight < ApplicationRecord
  validates :departure_airport, :arrival_airport, :start_datetime, :duration_minutes, presence: true
  validates :departure_airport, comparison: { other_than: :arrival_airport }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :booked_passengers, through: :bookings, source: :passengers

  scope :around_date, ->(date_string, day_interval = 1) {
    if date_string.present?
      date = Date.parse(date_string)

      lower_date = date - day_interval.days
      upper_date = date + day_interval.days
      where(start_datetime: (lower_date..upper_date))
    end
  }

  scope :from_departure_airport, ->(departure_airport_id) {
    if departure_airport_id.present?
      where(departure_airport: Airport.find(departure_airport_id))
    end
  }

  scope :to_arrival_airport, ->(arrival_airport_id) {
    if arrival_airport_id.present?
      where(arrival_airport: Airport.find(arrival_airport_id))
    end
  }
end
