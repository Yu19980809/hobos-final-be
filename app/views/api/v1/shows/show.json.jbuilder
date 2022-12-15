json.show do
  json.extract! @show, :id, :name, :description, :date, :start_time, :end_time, :address, :club_id
  json.club_name @show.club.name
  json.booking @booking
  json.poster @show.poster.attached? ? @show.poster.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'

  json.members @members do |member|
    json.id member.id
    json.avatar member.avatar.attached? ? member.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end

  json.comedians @comedians do |comedian|
    json.id comedian.id
    json.nickname comedian.nickname
    json.avatar comedian.avatar.attached? ? comedian.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
