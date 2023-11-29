class FlightsController < ApplicationController
  include Pagy::Backend

  # GET /flights or /flights.json
  def index
    @num_passengers_options = (1..4).map { |num| [num, num] }.insert(0, nil)
    @airport_options = Airport.all.map { |airport| [ airport.code, airport.id ] }.insert(0, nil)

    if params[:date] || params[:departure_airport_id] || params[:arrival_airport_id]
      @pagy, @flights = pagy(Flight.around_date(params[:date])
                                  .from_departure_airport(params[:departure_airport_id])
                                  .to_arrival_airport(params[:arrival_airport_id])
                                  .order(:start_datetime))
    else
      @flights = nil
    end

    if params[:num_passengers].nil? || params[:num_passengers] == ""
      @num_passengers = 1
    else
      @num_passengers = params[:num_passengers]
    end
  end
end
