class Api::V1::ShowsController < Api::V1::BaseController
  before_action :set_show, only: %i[show update destroy]

  def index
    if params[:query]
      sql_query = <<~SQL
        shows.name ILIKE :query
        OR shows.description ILIKE :query
        OR shows.address ILIKE :query
        OR clubs.name ILIKE :query
      SQL

      @shows = Show.joins(:club).where(sql_query, query: "%#{params[:query]}%")
    else
      @shows = Show.includes(:club).all
    end
  end

  def show
    # members
    @members = @show.users

    # show_comedians
    @comedians = []
    @show.show_comedians.each do |sc|
      @comedians.push(sc.user)
    end

    # booking
    @booking = Booking.find_by(show: @show, user: @current_user)
  end

  def create
    show = Show.new(show_params)

    if show.save
      if show.poster.attached?
        render json: { show:, poster: url_for(show.poster) }
      else
        render json: { show:, poster: 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg' }
      end
    else
      render json: show.errors, status: :unprocessable_entity
    end
  end

  def update
    @show.update(show_params)
    render json: { show: @show }
  end

  def destroy
    @show.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :date, :start_time, :end_time, :address, :club_id)
  end

  def set_show
    @show = Show.find(params[:id])
  end
end
