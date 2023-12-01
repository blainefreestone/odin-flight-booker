FactoryBot.define do
  factory :flight do
    arrival_airport
    departure_airport
    start_datetime { DateTime.now }
    duration_minutes { 30 }
  end
end
