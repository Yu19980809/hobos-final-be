json.comedians do
  json.array! @comedians do |comedian|
    json.extract! comedian, :id, :nickname, :slogan
    json.avatar comedian.avatar.attached ? url_for(@comedian.avatar) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-avatar.jpg'
  end
end
