User.create!(name:  "Example User",
             email: "vantri.dev@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now
             )

99.times do |n|
  name=Faker::Name.name
  email= "example-#{n+1}@railstutorial.org"
  password="password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
    )
end
Typemicropost.create!(name: "Lap Trinh")
Typemicropost.create!(name: "Ngoai Ngu")
users = User.order(:created_at).take(6)
# t = Typemicropost.take(2)
20.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 1, title: title) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

