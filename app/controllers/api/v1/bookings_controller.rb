class Api::V1::BookingsController < Api::V1::BaseController
  def create
    booking = Booking.new(booking_params)
    booking.user = @current_user
    if booking.save
      render json: { booking: }
    else
      render json: booking.errors, status: :unprocessable_entity
    end
  end

  def index
    @shows = []
    @bookings = Booking.where(user: @current_user)
    @bookings.each do |booking|
      @shows.unshift(booking.show)
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def booking_params
    params.require(:booking).permit(:show_id)
  end
end
