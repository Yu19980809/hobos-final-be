json.club do
  json.extract! @club, :id, :name, :address, :description
  json.avatar @club.user.avatar.attached? ? @club.user.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'

  json.shows @shows do |show|
    json.extract! show, :id, :name, :date, :start_time, :end_time, :address
    json.club_name @club.name
    json.poster show.poster.attached? ? show.poster.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'
  end
end
