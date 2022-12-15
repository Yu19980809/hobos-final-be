json.clubs do
  json.array! @clubs do |club|
    json.extract! club, :id, :name, :address, :description
    json.avatar club.user.avatar.attached? ? club.user.avatar.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
