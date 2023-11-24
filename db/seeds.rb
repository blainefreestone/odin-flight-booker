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