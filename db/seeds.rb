User.create!(
  email: "gaze25@okinawa.li",
  password: "lalala1",
  provider: "aoki",
  uid: "20",
  username: "aokikunn",
  avatar: File.open("./app/assets/images/default.jpg")
)

Review.create!(
  name: "aokikun",
  title: "iine",
  body: "iiyo",
  user_id: "20",
  school_id: "1"
)

Profile.create!(
  user_id: "20",
  name: "aokikun",
  age: "20~24歳",
  introduce: "saikou"
)

Review.users.create!(
  avatar: File.open("./app/assets/images/default.jpg")
)