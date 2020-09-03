User.create(email: "yuku@yuku", encrypted_password: "lalala1", reset_password_token: "lalala1", username: "ao")

Profile.create(user_id: "1", name: 'yori', age: '5', liveplace: 'Tokyo', introduce: 'aaaaa')

School.create(name: "Pallete School", address: "GK Enchanted Farm, California St., Brgy Encanto, Angat, Bulacan, the Philippines", tell: "080-0000-0000", genre: "語学学校", detail: "素晴らしい学校", image_url_a: "pallete_a.png", image_url_b: "pallete_b.png", latitude: "14.923757", longitude: "121.0083377", opentime: "7:00-18:00", subgenre: "NPO", res_id: "1")

Review.create(name: "take", title: "hoge", body: "hoehoge", user_id: "1", school_id: "15", likes_count: "1")