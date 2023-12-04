class FlightsController < ApplicationController
  include Pagy::Backend

  # GET /flights or /flights.json
  def index
    @num_passengers_options = (1..4).map { |num| [num, num] }.insert(0, nil)
    @airport_options = Airport.all.map { |airport| [ airport.code, airport.id ] }.insert(0, nil)

    if query_params.present?
      @pagy, @flights = pagy(
        Flight.around_date(params[:date])
              .from_departure_airport(params[:departure_airport_id])
              .to_arrival_airport(params[:arrival_airport_id])
              .order(:start_datetime))
      @params_text = query_params_text
    else
      @flights = nil
    end

    unless params[:num_passengers].present?
      @num_passengers = 1
    else
      @num_passengers = params[:num_passengers]
    end
  end

  private

  def query_params
    params.permit(:date, :departure_airport_id, :arrival_airport_id)
  end

  def query_params_text
    query_params_text_hash = Hash.new
    query_params_text_hash[:date] = query_params[:date] if query_params[:date].present?
    query_params_text_hash[:departure_airport] = Airport.find(query_params[:departure_airport_id]).code if query_params[:departure_airport_id].present?
    query_params_text_hash[:arrival_airport] = Airport.find(query_params[:arrival_airport_id]).code if query_params[:arrival_airport_id].present?
    query_params_text_hash
  end
end
