require 'faker'

10.times do
  Stop.create(
    name: "#{Faker::Artist.name}"
  )
end

10.times do
  example = User.create(
    user_name: "#{Faker::Alphanumeric.alpha 10}",
    email: "#{Faker::Alphanumeric.alpha 8}@happypath.com",
    password: "password"
  )
  5.times do
    Review.create(
      stop_id: Faker::Number.between(1, 10),
      rating: Faker::Number.between(1, 5),
      body: Faker::TvShows::GameOfThrones.quote,
      user_id: example.id
    )
  end
end

User.create(
  user_name: "fakeadmin",
  email: "fakeadmin@happypath.com",
  password: "password",
  admin: true
)
