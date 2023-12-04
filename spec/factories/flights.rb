FactoryBot.define do
  factory :flight do
    arrival_airport
    departure_airport
    start_datetime { DateTime.new(year=2023, month=12, day=25) }
    duration_minutes { 30 }
  end
end
