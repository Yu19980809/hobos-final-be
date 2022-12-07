puts "deleting all previous data"
Booking.destroy_all
ShowComedian.destroy_all
Show.destroy_all
ClubFollowing.destroy_all
ComedianFollowing.destroy_all
Club.destroy_all
User.destroy_all
puts "finished deleting"

puts "creating new data"

User.create!(nickname: "路人甲", role: "audience")
User.create!(nickname: "路人乙", role: "comedian")
User.create!(nickname: "路人丙", role: "holder")

Club.create!(name: "俱乐部A", address: "延平路425号401", user: User.find_by(role: "holder"))

Show.create!(name: "测试演出", description: "测试简介", date: "2022/12/05", start_time: "19:30", end_time: "21:30", address: "昌平路", club: Club.first)

Booking.create!(show: Show.first, user: User.find_by(role: "audience"))

ShowComedian.create!(show: Show.first, user: User.find_by(role: "comedian"))

ClubFollowing.create!(user: User.find_by(role: "comedian"), club: Club.first)

ComedianFollowing.create!(user: User.find_by(role: "audience"), comedian: User.find_by(role: "comedian"))


puts "finished creating"
