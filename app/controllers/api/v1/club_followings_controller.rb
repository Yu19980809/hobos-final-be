class Api::V1::ClubFollowingsController < Api::V1::BaseController
  def index
    club_followings = ClubFollowing.where(user: @current_user)
    render json: { club_followings: }
  end

  def create
    club_following = ClubFollowing.new(club_following_params)
    club_following.user = @current_user

    if @club_following.save
      render json: { club_following:  }
    else
      render json: club_following.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @club_following = ClubFollowing.find(params[:id])
    @club_following.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def club_following_params
    params.require(:club_following).permit(:club_id)
  end
end
