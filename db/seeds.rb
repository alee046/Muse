
User.destroy_all

users = [{
  user_name: "alee046",
  email: "alee046@ucr.edu",
  password: '123123',
  admin: true
}, {
  user_name: "alee047",
  email: "alee041@ucr.edu",
  password: '123123',
  admin: false
}, {
  user_name: "alee048",
  email: "alee042@ucr.edu",
  password: '123123',
  admin: false
}, {
  user_name: "alee049",
  email: "alee043@ucr.edu",
  password: '123123',
  admin: false
}, {
  user_name: "alee045",
  email: "alee044@ucr.edu",
  password: '123123',
  admin: false
}, {
  user_name: "alee044",
  email: "alee048@ucr.edu",
  password: '123123',
  admin: false
}]

User.create users
users = User.order(:created_at).take(3)
6.times do
  content = "https://www.youtube.com/embed/sV3iJsMbaLo"
  users.each { |user| user.posts.create!(content: content) }
end
