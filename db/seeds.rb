require 'open-uri'

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
USERS = [
  {
    info: {
      nickname: "脱缰野马",
      role: "audience"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/4.webp"
  },
  {
    info: {
      nickname: "JUMP",
      role: "comedian",
      slogan: "脱口秀大会三选手，贰叁叁合伙人",
      experience: "Jump的脱口秀之路，源于2017年的一次线下演出。他被朋友拉来听脱口秀，听完之后便跃跃欲试，认为自己也能写，并不比台上的人差。第二次再来的时候，他就已经备好了稿子准备上台。“2017年11月10号，当时我就坐在这候场，其他人都互相认识，就我谁都不认识，一个人坐在这一直背词背词。”Jump指着我坐的座位：“就是这个位置”。第一次演出，全场沸腾，Jump说那时候觉得自己简直就是个天才，自己花了一晚上写的稿子就这么厉害，绝对是个天才。不过第二天，现实给他浇了一盆冷水，同样的段子，第二天全场冷场。Jump说，那一刻他意识到自己跟别人根本没什么不同，没有天赋，要想在这个圈子里有所作为，只能靠日复一日的努力。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/Jump.png"
  },
  {
    info: {
      nickname: "贰叁叁喜剧",
      role: "holder"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E8%B4%B0%E5%8F%81%E5%8F%81%E4%BF%B1%E4%B9%90%E9%83%A8.webp"
  },
  {
    info: {
      nickname: "一绝",
      role: "comedian",
      slogan: "沉迷于写代码的脱口秀新人",
      experience: "22年9月开始说脱口秀，十五场开放麦经验。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E4%B8%80%E7%BB%9D.JPG"
  },
  {
    info: {
      nickname: "喜剧联合国",
      role: "holder"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E5%96%9C%E5%89%A7%E8%81%94%E5%90%88%E5%9B%BD.png.webp"
  },
  {
    info: {
      nickname: "乐合喜剧",
      role: "holder"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E4%B9%90%E5%90%88%E5%96%9C%E5%89%A7.png"
  },
  {
    info: {
      nickname: "夏厂长",
      role: "comedian",
      slogan: "上海人兼上海女婿",
      experience: "夏厂长有把好嗓子，始终字正腔圆地带领观众进入他的故事。作为一个专门帮别人规划工作的人，他对自己的规划是创业表演两开花。夏厂长已经积累一定的脱口秀表演经验，在经过学习后，他吸收了更多的理论，在生活中抛梗讲笑话，在夏厂长这里已经不算段子了。未来，希望夏厂长也可以成为他喜爱的周奇墨那样的“声音好听又好笑”的脱口秀演员。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E5%A4%8F%E5%8E%82%E9%95%BF.jpg"
  },
  {
    info: {
      nickname: "阿饼",
      role: "comedian",
      slogan: "快乐就完事了",
      experience: "阿饼的状态是我们大部分人一生都想追求的，快乐至上。他现在没有在工作，阿饼是这样计算的：工作为了赚钱，赚钱为了玩乐，那为什么不直接玩乐？（道理我们都懂，可是玩乐需要钱啊喂！）阿饼已经准备全职表演脱口秀，回想起第一次上开放麦的经历，他表示当时登台后大脑一片空白，整个人在颤抖中完成了表演。过后回看演出视频，再一点一点调整存在的问题，说更好的脱口秀。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E9%98%BF%E9%A5%BC.png"
  },
  {
    info: {
      nickname: "徐智成",
      role: "comedian",
      slogan: "除了可爱还是可爱",
      experience: "徐智成同学的工作是IT，而且真的是被长辈误解的修电脑的那种IT。讲脱口秀是因为觉得自己是缺爱的搞笑男，想在台上让大家喜欢自己。回想起第一次登台演出，他反而觉得是轻松的，因为“上去哐哐可爱就好了”，观众很乐于为这份可爱买单。但在之后的表演中，难度会提升。他似乎觉得他的幽默被可爱压制住了，希望以后可以保持可爱，增加幽默~"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E5%BE%90%E6%99%BA%E6%88%90.png"
  },
  {
    info: {
      nickname: "铁锤",
      role: "comedian",
      slogan: "满身绝活儿",
      experience: "来自文化地产行业的铁锤同学，经常带给人惊喜。变脸大师有多张花脸，铁锤就有多少种身份，所以他常带给我们惊喜。由于有即兴喜剧的表演经验，所以他感觉每个人5分钟的开放麦只是刚刚热身而已。但无论是什么喜剧细分类别，无论表演时间长短，对铁锤来说都只是他生活的一部分，一个迷人的、可以丰盈他的人生旅程的有趣部分。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E9%93%81%E9%94%A4.png"
  },
  {
    info: {
      nickname: "文强",
      role: "comedian",
      slogan: "确实有点强",
      experience: "从大学开始接触话剧，从《脱口秀大会》开始了解脱口秀。表演了一段时间的线下脱口秀后，就准备付出全部精力，全职发展脱口秀。文强觉得他离完成精准的表达还是有一定距离的，他想实现和观众间真正的交流。但现在在表演方面的心态强化了许多，至少开放麦试新段子冷场了也不会再紧张。那就先祝文强的商演马上稳定下来。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E6%96%87%E5%BC%BA.png"
  },
  {
    info: {
      nickname: "茅十八",
      role: "comedian",
      slogan: "一切由嘴巴贱开始",
      experience: "在看到这个名字时，小编还以为这是一位同《鹿鼎记》中的角色一般的彪形大汉，但其实本人还是比较生活的，不武侠。茅十八是一位纯新人，在朋友们都表示他嘴巴贱的“鼓励”下，开始尝试脱口秀。唯二的两次登台表演就是在贰叁叁的开放麦，这份登台记忆还是新鲜热乎的。由于初次表演容易紧张，所以忘词是他的一个坎儿，但同时他也发现，来看开放麦的观众都很宽容，这在给予演员信心、鼓励的同时，有时还能产生意外的演出效果。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E8%8C%85%E5%8D%81%E5%85%AB.png"
  },
  {
    info: {
      nickname: "大炯",
      role: "comedian",
      slogan: "喜剧摸索者",
      experience: "大炯从南京过来，来这片脱口秀的肥沃土壤进行自己进一步的脱口秀尝试。大炯发现以前创作的文本存在乱的问题，一套成熟的、被观众所接受的段子该是有结构的、规范的、主题明晰的，该是有灵魂的表达。在表演方面的难点，则需要真情实感的展现，但是紧张的情绪与感情的呈现恰好是敌对关系。所以让一切流畅起来，欠缺的是更多的登台表演，加油吧，大炯。"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E5%A4%A7%E7%82%AF.png"
  },
  {
    info: {
      nickname: "惠子",
      role: "comedian",
      slogan: "标准斜杠青年",
      experience: "惠子有一头飘逸的长发，刚刚见面，她就表示既然有镜头，那必须掏出梳子飘柔一下。惠子本身就是即兴喜剧培训讲师，而且还有进行漫才表演，属于喜剧行业的“老人儿”了。惠子有着丰富的戏剧表演经验，但在刚刚接触脱口秀表演时，还是会有一些不适应。因为在话剧表演中，人在角色里，而脱口秀是表演者即本人，演员需要打破第四面墙，将观众容纳进来，演员在台上必须要真诚，所以惠子创作的段子是含有大量的她的观点表达的。此外，惠子还是货真价实的持证道士！相较于此，甚至环球小姐参赛者的身份都要往后排了呢~"
    },
    avatar: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/avatar/%E6%83%A0%E5%AD%90.png"
  },
]

USERS.each do |user|
  new_user = User.new(user[:info])
  avatar = URI.open(user[:avatar])
  new_user.avatar.attach(io: avatar, filename: user[:info][:nickname])
  new_user.save!
end

CLUBS = [
  {
    name: "贰叁叁喜剧",
    address: "天钥桥路123号城开YOYO七楼",
    description: "贰叁叁脱口秀是上海单口喜剧俱乐部，一支致力于给观众带来快乐的脱口秀团队，厂牌负责人谢海涵，ROCK、梁海源、昌叔、赵有成、JUMP、芮宇等众多优秀的脱口秀演员都在贰叁叁演出过。",
    user: User.find_by(nickname: "贰叁叁喜剧")
  },
  {
    name: "喜剧联合国",
    address: "汉口路650号亚洲大厦11楼星空间18号",
    description: "喜剧联合国是Storm创立的，他希望借助这个平台把单口喜剧推广给更多人。在这里表演的人，有的已经颇具名气，比如《脱口秀大赛》的冠军庞博当晚也登台演出，有的是白天上班、晚上来表演的非全职演员，也有没有经验的素人爱好者。中文之外，还有英文的演出场次。",
    user: User.find_by(nickname: "喜剧联合国")
  },
  {
    name: "乐合喜剧",
    address: "恒基名人购物中心四楼",
    description: "乐合喜剧俱乐部创建于于2014年，是目前上海地区历史很长寿的脱口秀（单口喜剧Stand-up Comedy）俱乐部。乐合喜剧自创立开始，即自然的成为了上海脱口秀演员锻炼和成长的摇篮。几乎所有在上海及苏州、杭州等周边地区的脱口秀演员，都会把在乐合喜剧开放麦表演作为检验自己表演质量的重要一站。",
    user: User.find_by(nickname: "乐合喜剧")
  }
]

CLUBS.each do |club|
  Club.create!(club)
end

SHOWS = [
  {
    info: {
      name: "牡丹麦放开",
      description: "什么是麦放开~?牡丹麦放开活动是仿照脱口秀开放麦的一种活动，是open-mic的“精神继承者”，与营利性演出性质的演出不同，牡丹麦放开是为参与者提供一个见证脱口秀表演诞生的活动。台上的人演笑话，台下的人看笑话。收费演出上脱口秀的段子都是之前要在麦放开（open-mic）上百上千次打磨才完成的！",
      date: "2022/12/29",
      start_time: "21:15",
      end_time: "22:30",
      address: "恒基名人购物中心4楼",
      club: Club.find_by(name: "乐合喜剧")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E7%89%A1%E4%B8%B9%E9%BA%A6%E6%94%BE%E5%BC%80.png"
  },
  {
    info: {
      name: "牡丹麦放开",
      description: "什么是麦放开~?牡丹麦放开活动是仿照脱口秀开放麦的一种活动，是open-mic的“精神继承者”，与营利性演出性质的演出不同，牡丹麦放开是为参与者提供一个见证脱口秀表演诞生的活动。台上的人演笑话，台下的人看笑话。收费演出上脱口秀的段子都是之前要在麦放开（open-mic）上百上千次打磨才完成的！",
      date: "2022/12/20",
      start_time: "21:15",
      end_time: "22:30",
      address: "恒基名人购物中心4楼",
      club: Club.find_by(name: "乐合喜剧")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E7%89%A1%E4%B8%B9%E9%BA%A6%E6%94%BE%E5%BC%80.png"
  },
  {
    info: {
      name: "牡丹麦放开",
      description: "什么是麦放开~?牡丹麦放开活动是仿照脱口秀开放麦的一种活动，是open-mic的“精神继承者”，与营利性演出性质的演出不同，牡丹麦放开是为参与者提供一个见证脱口秀表演诞生的活动。台上的人演笑话，台下的人看笑话。收费演出上脱口秀的段子都是之前要在麦放开（open-mic）上百上千次打磨才完成的！",
      date: "2022/11/20",
      start_time: "21:15",
      end_time: "22:30",
      address: "恒基名人购物中心4楼",
      club: Club.find_by(name: "乐合喜剧")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E7%89%A1%E4%B8%B9%E9%BA%A6%E6%94%BE%E5%BC%80.png"
  },
  {
    info: {
      name: "圣诞主题挑战赛",
      description: "如果说，笑声是疲惫生活的解药，那脱口秀就是情绪治愈良药。圣诞夜分子脱口秀，25日晚在数码港展厅如约开场！一剂情绪良药，一份岁末好礼，在2021年的圣诞节，送给你！",
      date: "2022/12/25",
      start_time: "19:30",
      end_time: "21:30",
      address: "天钥桥路123号城开YOYO七楼",
      club: Club.find_by(name: "贰叁叁喜剧")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E5%9C%A3%E8%AF%9E%E8%8A%82.png"
  },
  {
    info: {
      name: "王炸！喜联脱口秀大赛",
      description: "王炸！第三届全国脱口秀大赛报名结束啦！非常感谢大家报名我们的比赛，本次比赛创造了几个小小的记录：01-报名人数历届最多：本次比赛报名人数总计263人。02-报名城市最多：本次比赛收到来自33个城市的选手报名，年龄跨度最大18-71岁。03-报名女选手最多：本次比赛报名女选手最多，占总比例31%，并且首次有住在国外的中文选手出现（他将在满足隔离条件后参赛）",
      date: "2022/12/24",
      start_time: "19:30",
      end_time: "22:00",
      address: "汉口路650号亚洲大厦11楼星空间18号",
      club: Club.find_by(name: "喜剧联合国")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E7%8E%8B%E7%82%B8%E8%84%B1%E5%8F%A3%E7%A7%80.png"
  },
  {
    info: {
      name: "贰叁叁新人赛",
      description: "脱口秀像一块巨大的磁铁，将这些喜剧铁粉汇聚到贰叁叁。每个人都试图通过自己的努力将引力扩大，把快乐传递给更多人。毕业演出对于大部分同学来说，是终于登上了心仪的舞台、在新场地试练；而对有的同学来说，还只是其漫长的脱口秀生涯中的前几次表演，一切还是满溢新鲜感的。对于脱口秀演员来说，再多的故事，都只有在传递给观众的时刻才算完成。无论之前创作的文本有多完整，只要没登台，Ta就像一个胎儿阶段的新生命，还没有迎接来自己的出生。",
      date: "2022/12/18",
      start_time: "19:30",
      end_time: "21:30",
      address: "南京东路479号 NO Rules酒吧",
      club: Club.find_by(name: "贰叁叁喜剧")
    },
    poster: "https://hobos-final.oss-cn-shanghai.aliyuncs.com/poster/%E8%B4%B0%E5%8F%81%E5%8F%81%E6%96%B0%E4%BA%BA%E8%B5%9B.png"
  }
]

SHOWS.reverse.each do |show|
  new_show = Show.new(show[:info])
  poster = URI.open(show[:poster])
  new_show.poster.attach(io: poster, filename: show[:info][:name])
  new_show.save!
end

SHOWCOMEDIANS = [
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/11/20"),
    user: User.find_by(nickname: "惠子")
  },
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/12/20"),
    user: User.find_by(nickname: "阿饼")
  },
  {
    show: Show.find_by(name: "贰叁叁新人赛"),
    user: User.find_by(nickname: "一绝")
  },
  {
    show: Show.find_by(name: "贰叁叁新人赛"),
    user: User.find_by(nickname: "茅十八")
  },
  {
    show: Show.find_by(name: "王炸！喜联脱口秀大赛"),
    user: User.find_by(nickname: "夏厂长")
  },
  {
    show: Show.find_by(name: "王炸！喜联脱口秀大赛"),
    user: User.find_by(nickname: "文强")
  },
  {
    show: Show.find_by(name: "王炸！喜联脱口秀大赛"),
    user: User.find_by(nickname: "JUMP")
  },
  {
    show: Show.find_by(name: "圣诞主题挑战赛"),
    user: User.find_by(nickname: "JUMP")
  },
  {
    show: Show.find_by(name: "圣诞主题挑战赛"),
    user: User.find_by(nickname: "大炯")
  },
  {
    show: Show.find_by(name: "圣诞主题挑战赛"),
    user: User.find_by(nickname: "一绝")
  },
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/12/29"),
    user: User.find_by(nickname: "文强")
  }
]

SHOWCOMEDIANS.each do |sc|
  ShowComedian.create!(sc)
end

BOOKINGS = [
  {
    show: Show.find_by(name: "贰叁叁新人赛", date: "2022/12/18"),
    user: User.find_by(nickname: "一绝")
  },
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/11/20"),
    user: User.find_by(nickname: "脱缰野马")
  },
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/12/20"),
    user: User.find_by(nickname: "夏厂长")
  },
  {
    show: Show.find_by(name: "王炸！喜联脱口秀大赛", date: "2022/12/24"),
    user: User.find_by(nickname: "铁锤")
  },
  {
    show: Show.find_by(name: "圣诞主题挑战赛", date: "2022/12/25"),
    user: User.find_by(nickname: "JUMP")
  },
  {
    show: Show.find_by(name: "牡丹麦放开", date: "2022/12/29"),
    user: User.find_by(nickname: "惠子")
  },
]

BOOKINGS.each { |booking| Booking.create!(booking) }

puts "finished creating"
