json.show do
  json.extract! @show, :id, :name, :description, :date, :start_time, :end_time, :address, :club_id
  json.club_name @show.club.name
  json.booking @booking
  json.poster @show.poster.attached? ? url_for(@show.poster) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'

  json.members @members do |member|
    json.id member.id
    json.avatar member.avatar.attached? ? url_for(member.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end

  json.comedians @comedians do |comedian|
    json.id comedian.id
    json.nickname comedian.nickname
    json.avatar comedian.avatar.attached? ? url_for(comedian.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
