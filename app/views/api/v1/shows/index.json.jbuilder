json.shows do
  json.array! @shows do |show|
    json.extract! show, :name, :description, :date, :start_time, :end_time, :address, :club_id, :poster
    json.club_name show.club.name
  end
end
