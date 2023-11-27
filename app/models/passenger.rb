class Passenger < ApplicationRecord
    belongs_to :booking
    has_many :booked_flights, through: :booking, source: :flight
end
