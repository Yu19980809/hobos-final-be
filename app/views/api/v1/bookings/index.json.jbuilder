json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :show_id, :user_id
  end
end

json.shows do
  json.array! @shows do |show|
    json.extract! show, :id, :name, :description, :date, :start_time, :end_time, :address, :club_id, :poster
    json.club_name show.club.name
    json.poster show.poster.attached? ? show.poster.url : 'https://hobos-final.oss-cn-shanghai.aliyuncs.com/default-poster.jpg'
  end
end
