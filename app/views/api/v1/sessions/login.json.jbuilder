json.user do
  json.extract! @user, :id, :nickname, :open_id, :role, :avatar
  json.comedian_followings @user.comedian_followings
  json.club_followings @user.club_followings
  json.comedian_followers @comedian_followers
  json.club_followers @club_followers
  json.avatar @user.avatar.attached? ? url_for(@user.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
end
