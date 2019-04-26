require 'rails_helper'

RSpec.describe Stop, type: :model do

  it { should have_valid(:name).when("Johnny")}
  it { should_not have_valid(:name).when(nil,"")}
  it 'should have_many reviews (association test)' do
    my_stop = Stop.create!(name: "stopa")
    rev1 = Review.create!(rating: 5, body: "this is my review", stop_id: my_stop.id)
    rev2 = Review.create!(rating: 1, body: "this is your review", stop_id: my_stop.id)

    expect(my_stop.reviews.length).to equal(2)
  end
end
