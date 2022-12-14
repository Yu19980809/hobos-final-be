class Api::V1::UsersController < Api::V1::BaseController
  def show
    @comedian = User.find(params[:id])
    @shows = []
    ShowComedian.where(user: @comedian).each do |sc|
      @shows.unshift(sc.show)
    end
  end

  def update
    @current_user.update(user_params)
    render json: { user: @current_user }
  end

  def shows
    @shows = []
    @current_user.clubs.each do |club|
      @shows.concat(Show.where(club:))
    end
  end

  def comedians
    @comedians = User.where(role: 'comedian')
  end

  private

  def user_params
    # params.require(:user).permit(:nickname, :role, :avatar, :slogan, :experience)
    params.require(:user).permit(:nickname, :role, :slogan, :experience)
  end
end
