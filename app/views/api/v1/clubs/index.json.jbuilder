json.clubs do
  json.array! @clubs do |club|
    json.extract! club, :id, :name, :address, :description
    json.avatar club.user.avatar.attached ? url_for(club.user.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
