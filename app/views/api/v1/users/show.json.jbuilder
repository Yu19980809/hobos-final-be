json.comedian do
  json.extract! @comedian, :id, :nickname, :slogan, :experience
  json.avatar @comedian.avatar.attached ? url_for(@comedian.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'

  json.shows @shows do |show|
    json.extract! show, :id, :name, :date, :start_time, :end_time, :address
    json.club_name show.club.name
    json.poster show.poster.attached? ? url_for(show.poster) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'
  end
end
