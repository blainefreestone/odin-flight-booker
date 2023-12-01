FactoryBot.define do
  factory :airport, aliases: [:arrival_airport, :departure_airport] do
    sequence(:code, "AAA")
  end
end
