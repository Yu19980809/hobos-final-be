json.user do
  json.extract! @user, :id, :nickname, :open_id, :role, :avatar
  json.comedian_followers @comedian_followers
  json.club_followers @club_followers
  json.club @user.clubs[0]
  json.avatar @user.avatar.attached? ? url_for(@user.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'

  json.followed_comedians @followed_comedians do |comedian|
    json.extract! comedian, :id, :nickname, :slogan, :role, :experience
    json.avatar comedian.avatar.attached? ? url_for(comedian.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end

  json.followed_clubs @followed_clubs do |club|
    json.extract! club, :id, :name, :address, :description
    json.avatar club.user.avatar.attached? ? url_for(club.user.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
