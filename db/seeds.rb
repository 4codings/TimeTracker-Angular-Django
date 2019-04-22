require 'faker'

50.times do
  Stop.create(
    name: "#{Faker::Artist.name}"
  )
end
