require 'faker'

# 50.times do
#   Stop.create(
#     name: "#{Faker::Artist.name}"
#   )
# end

rev_count = 1
50.times do
  2.times do
    Review.create(
      stop_id: rev_count,
      rating: Faker::Number.between(1, 5),
      body: Faker::TvShows::GameOfThrones.quote
    )
  end
  rev_count +=1
end
