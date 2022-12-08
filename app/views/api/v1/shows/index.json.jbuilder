json.shows do
  json.array! @shows do |show|
    json.extract! show, :id, :name, :description, :date, :start_time, :end_time, :address, :club_id, :poster
    json.club_name show.club.name
    json.poster show.poster.attached? ? url_for(show.poster) : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'
  end
end
