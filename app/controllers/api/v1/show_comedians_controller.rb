class Api::V1::ShowComediansController < Api::V1::BaseController
  def create
    show_comedian = ShowComedian.new(show_comedian_params)

    if show_comedian.save
      render json: { show_comedian:  }
    else
      render json: show_comedian.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if params[:show_id]
      show_comedian = ShowComedian.find_by(show_id: params[:show_id], user_id: params[:comedian_id])
    else
      show_comedian = ShowComedian.find(params[:id])
    end
    show_comedian.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def show_comedian_params
    params.require(:show_comedian).permit(:show_id, :user_id)
  end
end
