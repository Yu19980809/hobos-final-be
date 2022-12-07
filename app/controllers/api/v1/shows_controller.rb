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

      shows = Show.joins(:club).where(sql_query, query: "%#{params[:query]}%")
    else
      shows = Show.all
    end

    render json: { shows: }
  end

  def show
    render json: { show: @show }
  end

  def create
    show = Show.new(show_params)
    if show.save
      render json: { show: }
    else
      render json: @show.errors, status: :unprocessable_entity
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
    params.require(:show).permit(:name, :description, :date, :start_time, :end_time, :address, :club_id, :poster)
  end

  def set_show
    @show = Show.find(params[:id])
  end
end
