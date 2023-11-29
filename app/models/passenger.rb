class Passenger < ApplicationRecord
    validates :name, :email, :booking_id, presence: true
    
    belongs_to :booking
    has_one :flight, through: :booking
end
