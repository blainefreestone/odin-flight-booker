class Booking < ApplicationRecord
  validates :flight, presence: true
  
  has_many :passengers, dependent: :destroy
  belongs_to :flight

  accepts_nested_attributes_for :passengers
end