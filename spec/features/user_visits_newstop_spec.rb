require 'rails_helper'

feature 'invalid user is blocked from new stop page'  do

  invalid_user = User.create(
    user_name: "SaddestPath",
    email: "sad@path.com",
    password: "password"
  )

  scenario 'user sees not found error' do
    sign_in invalid_user
    expect{visit new_stop_path}.to raise_error("Not Found")
  end

end

feature 'valid user visits new stop page'  do

  before(:each) do
    DatabaseCleaner.clean_with(:deletion)
    valid_user = User.create!(
      user_name: "HappyPath",
      email: "happy@path.com",
      password: "password",
      admin: true
    )
    sign_in valid_user
  end

  scenario 'user sees stop form' do
    visit new_stop_path
    expect(page).to have_content("New Stop Page")
  end

  scenario 'user does the right thing' do
    visit new_stop_path
    fill_in "stop_name", with: "HappyPath"
    click_button "Submit Stop"
    expect(page).to have_content("stop created successfully")
  end

  scenario 'user does the wrong thing' do
    visit new_stop_path
    click_button "Submit Stop"
    expect(page).to have_content("Name can't be blank")
  end

end
