# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed 30 airports in the United States.
Airport.delete_all

airport_codes = ["ATL","DFW","DEN","ORD","LAX","JFK","LAS","MCO","MIA","CLT","SEA","PHX","EWR","SFO","IAH","BOS","FLL","MSP","LGA","DTW","PHL","SLC","DCA","SAN","BWI","TPA","AUS","IAD","BNA","MDW"]

airport_codes.each do |code|
    Airport.create!(code: code)
end

# Seed flights.
Flight.delete_all

DEP_FLIGHT_INDEX = 0
ARR_FLIGHT_INDEX = 1
flights_run_for_minutes = 43800
Airport.all.to_a.permutation(2).to_a.each do |flights_array|
    flight_duration = rand(45..500)
    flight_frequency_minutes = rand(45..2880)
    num_flights = (flights_run_for_minutes / flight_frequency_minutes).floor
    running_flight_datetime = DateTime.now + rand(10080...12080).minutes

    num_flights.times do
        Flight.create!(
            departure_airport: flights_array[DEP_FLIGHT_INDEX],
            arrival_airport: flights_array[ARR_FLIGHT_INDEX],
            start_datetime: running_flight_datetime,
            duration_minutes: flight_duration
        )
        running_flight_datetime += flight_frequency_minutes.minutes
    end
end