class Passenger < ApplicationRecord
    validates :name, :email, presence: true
    
    belongs_to :booking
    has_one :flight, through: :booking
end
