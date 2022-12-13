class Api::V1::ComedianFollowingsController < Api::V1::BaseController
  def index
    comedian_followings = ComedianFollowing.where(user: @current_user)
    render json: { comedian_followings: }
  end

  def create
    comedian_following = ComedianFollowing.new(comedian_following_params)
    comedian_following.user = @current_user

    if comedian_following.save
      render json: { comedian_following:  }
    else
      render json: comedian_following.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comedian_following = ComedianFollowing.where(comedian_id: params[:comedian_id], user: @current_user)[0]
    comedian_following.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def comedian_following_params
    params.require(:comedian_following).permit(:comedian_id)
  end
end
