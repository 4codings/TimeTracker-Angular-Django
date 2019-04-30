require 'rails_helper'
require 'launchy'

feature 'invalid user is blocked from admin page'  do

  invalid_user = User.create(
    user_name: "SaddestPath",
    email: "sad@path.com",
    password: "password"
  )

  scenario 'user sees not found error' do
    sign_in invalid_user
    expect{visit admin_reviews_path}.to raise_error("Not Found")
  end

end

feature 'valid user visits admin page'  do
  before(:each) do
    DatabaseCleaner.clean_with(:deletion)
    valid_user = User.create!(
      user_name: "HappyPath",
      email: "happy@path.com",
      password: "password",
      admin: true
    )
    new_stop = Stop.create!(
      name: "Stony Brook"
    )
    new_review = Review.create!(
      rating: 4,
      body: "test test",
      stop_id: new_stop.id
    )
    sign_in valid_user
  end

  scenario 'user sees review admin page' do
    visit admin_reviews_path
    expect(page).to have_content("Review Administration Page")
    expect(page).to have_content("test test")
  end

  scenario 'user clicks delete review button to delete review' do
    visit admin_reviews_path
    click_button "Delete Review"
    expect(page).to have_content("Review deleted")
    expect(page).to_not have_content("test test")
  end
end
