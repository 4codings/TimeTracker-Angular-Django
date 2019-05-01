require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should have_valid(:rating).when(1)}
  it { should_not have_valid(:rating).when(10)}
  it { should_not have_valid(:rating).when(nil, "")}
  it { should have_valid(:body).when("grayworm")}
  it { should_not have_valid(:body).when(nil, "")}

  it 'should belong_to a Stop (association test)' do
    new_user = User.create!(
      user_name: "HappyPath",
      email: "happy@path.com",
      password: "password"
    )
    my_stop = Stop.create!(name: "stopa")
    rev1 = Review.create!(
      rating: 5,
      body: "this is my review",
      stop_id: my_stop.id,
      user_id: new_user.id
    )

    expect(rev1.stop.name).to eq(my_stop.name)
  end
end
