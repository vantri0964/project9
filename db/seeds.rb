User.create!(name:  "Example User",
             email: "vantri.dev@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now
             )

40.times do |n|
  name=Faker::Name.name
  email= "example-#{n+1}@railstutorial.org"
  password="password"
  d = Faker::Time.between(15.days.ago, Date.today, :all)
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now,
    created_at: d.strftime("%m/%d/%Y")

    )
end
Typemicropost.create!(name: "Java")
Typemicropost.create!(name: "Ruby")
Typemicropost.create!(name: "Php")
Typemicropost.create!(name: "Front_end")
Typemicropost.create!(name: "Khác")
Typemicropost.create!(name: "Ngoại Ngữ")
users = User.order(:created_at).take(6)
# t = Typemicropost.take(2)
4.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 2, title: title) }
end
5.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 1, title: title) }
end
7.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 3, title: title) }
end
3.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 5, title: title) }
end
3.times do
  content = Faker::Lorem.sentence(10)
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
              typemicropost_id: 6, title: title) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

