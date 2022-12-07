class Api::V1::ClubsController < Api::V1::BaseController
  def create
    club = Club.new(club_params)
    club.user = @current_user

    if club.save
      render json: { club:  }
    else
      render json: club.errors, status: :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :address)
  end
end
