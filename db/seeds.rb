

Profile.create(user_id: 1, name: 'yori', age: '5', liveplace: 'Tokyo', introduce: 'aaaaa')
Profile.create(user_id: 2, name: 'ori', age: 'f', liveplace: 'Tokyo', introduce: 'aaaaa')

School.create(name: "taka", address: "osaka", tell: "080-33", latitude: "1", longitude: "2", genre: "2", subgenre: "3", opentime: "7", detail: "tako", image_url_a: "", image_url_b: ".png", res_id: "1")

Review.create(name: "take", title: "hoge", body: "hoehoge", user_id: "1", school_id: "1", likes_count: "1")
Review.create(name: "take", title: "hoge", body: "hoehoge", user_id: "2", school_id: "2", likes_count: "1")

Tag.create(name: "ken", taggings_count: "1")