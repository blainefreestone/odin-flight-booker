class Booking < ApplicationRecord
  validates :flight_id, presence: true
  
  has_many :passengers
  belongs_to :flight
end