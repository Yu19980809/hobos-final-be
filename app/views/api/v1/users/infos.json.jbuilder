json.user do
  json.extract! @current_user, :id, :nickname, :open_id, :role, :slogan, :experience
  json.comedian_followers @comedian_followers
  json.club_followers @club_followers
  json.club @current_user.clubs[0]
  json.avatar @current_user.avatar.attached? ? @current_user.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'

  json.followed_comedians @followed_comedians do |comedian|
    json.extract! comedian, :id, :nickname, :slogan, :role, :experience
    json.avatar comedian.avatar.attached? ? comedian.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end

  json.followed_clubs @followed_clubs do |club|
    json.extract! club, :id, :name, :address, :description
    json.avatar club.user.avatar.attached? ? club.user.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
