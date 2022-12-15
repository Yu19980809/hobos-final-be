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
    fetch_following(@current_user)
    fetch_follower(@current_user)
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

  def infos
    fetch_following(@current_user)
    fetch_follower(@current_user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :role, :slogan, :experience)
  end

  def fetch_follower(user)
    case user.role
    when 'comedian'
      @comedian_followers = []
      ComedianFollowing.all.each do |cf|
        @comedian_followers.push(cf) if cf.comedian.id == user.id
      end
    when 'holder'
      @club_followers = []
      ClubFollowing.all.each do |cf|
        @club_followers.push(cf) if user.clubs[0].id == cf.club.id
      end
    end
  end

  def fetch_following(user)
    @followed_comedians = []
    @followed_clubs = []

    user.comedian_followings.each do |cf|
      @followed_comedians.unshift(cf.comedian)
    end

    user.club_followings.each do |cf|
      @followed_clubs.unshift(cf.club)
    end
  end
end
