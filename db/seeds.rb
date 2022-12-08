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
User.create!(nickname: "路人丁", role: "audience")
User.create!(nickname: "路人戊", role: "comedian")
User.create!(nickname: "路人戌", role: "holder")

Club.create!(name: "乐合喜剧", address: "延平路425号401", user: User.where(role: "holder")[0])
Club.create!(name: "快乐源泉", address: "年吉路220号", user: User.where(role: "holder")[1])

Show.create!(name: "新人赛", description: "仅限新人", date: "2022/12/10", start_time: "19:00", end_time: "22:00", address: "昌平路", club: Club.first)
Show.create!(name: "开放麦", description: "全新体验", date: "2022/12/12", start_time: "19:00", end_time: "21:30", address: "胶州路", club: Club.second)
Show.create!(name: "巅峰赛", description: "高手对决", date: "2022/12/11", start_time: "19:30", end_time: "21:30", address: "延平路", club: Club.first)
Show.create!(name: "圣诞专题", description: "圣诞快乐", date: "2022/12/24", start_time: "19:30", end_time: "22:00", address: "康定路", club: Club.second)
Show.create!(name: "挑战赛", description: "新的风暴已经降临", date: "2022/12/20", start_time: "19:30", end_time: "21:30", address: "延平路", club: Club.first)
Show.create!(name: "跨年", description: "新年快乐", date: "2022/12/30", start_time: "19:30", end_time: "22:00", address: "外滩", club: Club.second)

Booking.create!(show: Show.first, user: User.where(role: "audience")[1])

ShowComedian.create!(show: Show.find_by(name: "新人赛"), user: User.where(role: "comedian")[0])
ShowComedian.create!(show: Show.find_by(name: "开放麦"), user: User.where(role: "comedian")[1])
ShowComedian.create!(show: Show.find_by(name: "巅峰赛"), user: User.where(role: "comedian")[1])
ShowComedian.create!(show: Show.find_by(name: "圣诞专题"), user: User.where(role: "comedian")[1])
ShowComedian.create!(show: Show.find_by(name: "挑战赛"), user: User.where(role: "comedian")[0])
ShowComedian.create!(show: Show.find_by(name: "跨年"), user: User.where(role: "comedian")[0])

ClubFollowing.create!(user: User.where(role: "comedian")[0], club: Club.first)
ClubFollowing.create!(user: User.where(role: "audience")[0], club: Club.last)

ComedianFollowing.create!(user: User.where(role: "audience")[0], comedian: User.where(role: "comedian")[0])


puts "finished creating"
