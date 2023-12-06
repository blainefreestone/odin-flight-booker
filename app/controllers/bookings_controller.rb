class BookingsController < ApplicationController
  authorize_resource
  
  def index
    @bookings = Booking.all
  end
  
  def new
    flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: flight)
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

  # def authenticate_admin
  #   if current_user.try(:admin?)
  #     render :index
  #   elsif current_user
  #     redirect_to root_path, alert: "You do not have permission to view this page"
  #   else
  #     authenticate_user!
  #   end
  # end
end
