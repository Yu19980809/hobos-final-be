class Api::V1::UsersController < Api::V1::BaseController
  def update
    @current_user.update(user_params)
    render json: { user: @current_user }
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :role, :avatar)
  end
end
