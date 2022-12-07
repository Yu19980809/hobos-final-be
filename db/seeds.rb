puts "deleting all previous data"
User.destroy_all
Club.destroy_all
Show.destroy_all
Booking.destroy_all
ShowComedian.destroy_all
ClubFollowing.destroy_all
ComedianFollowing.destroy_all
puts "finished deleting"

puts "creating new data"

User.create!(nickname: "路人甲", avatar_url: "https://tes.png", role: "audience")
User.create!(nickname: "路人乙", avatar_url: "https://tes.png", role: "comedian")
User.create!(nickname: "路人丙", avatar_url: "https://tes.png", role: "holder")

Club.create!(name: "俱乐部A", address: "延平路425号401", user: User.find_by(role: "holder"))

Show.create!(name: "测试演出", description: "测试简介", date: "2022/12/05", start_time: "19:30", end_time: "21:30", address: "昌平路", poster_url: "https://test.png", club: Club.first)

Booking.create!(show: Show.first, user: User.find_by(role: "audience"))

ShowComedian.create!(show: Show.first, user: User.find_by(role: "comedian"))

ClubFollowing.create!(user: User.find_by(role: "comedian"), club: Club.first)

ComedianFollowing.create!(user: User.find_by(role: "audience"), comedian: User.find_by(role: "comedian"))


puts "finished creating"
