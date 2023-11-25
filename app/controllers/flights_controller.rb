class FlightsController < ApplicationController
  include Pagy::Backend

  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @num_passengers_options = (1..4).map { |num| [num, num] }.insert(0, nil)
    @airport_options = Airport.all.map { |airport| [ airport.code, airport.id ] }.insert(0, nil)

    @pagy, @flights = pagy(Flight.around_date(params[:date])
                                 .from_departure_airport(params[:departure_airport_id])
                                 .to_arrival_airport(params[:arrival_airport_id])
                                 .order(:start_datetime))

    if params[:num_passengers].present? || params[:num_passengers] == ""
      @num_passengers = 1
    else
      @num_passengers = params[:num_passengers]
    end
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy!

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start_datetime, :flight_duration_minutes)
    end
end
