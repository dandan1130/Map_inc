User.create!(name:  "user",
             email: "user@gmail.com",
             password:              "user",
             password_confirmation: "user",
             admin: true)

Park.create(
    park_title: "東京タワー",
    park_address: "",
    park_discription: "",
    park_phone_number: "",
    station: "豊洲駅",
    park_image: "https://www.ryutsuu.biz/images/2020/01/20200121rara1.jpg",
    park_url:"https://mitsui-shopping-park.com/lalaport/toyosu/floor/"
    
    )
    
 Park.create(
    park_title: "豊洲ららぽーと",
    park_address: "",
    park_discription: "",
    park_phone_number: "",
    station: "豊洲駅",
    park_image: "https://www.ryutsuu.biz/images/2020/01/20200121rara1.jpg",
    park_url:"https://mitsui-shopping-park.com/lalaport/toyosu/floor/"
    
    )
    
    Bookmark.create!(user_id: 1, park_id: 1)
    Bookmark.create!(user_id: 1, park_id: 2)