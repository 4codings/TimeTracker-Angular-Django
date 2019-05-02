require 'rails_helper'
require 'launchy'

feature 'only admins see admin buttons'  do
  user = User.create!(
    user_name: "SaddestPath",
    email: "sad@path.com",
    password: "password"
  )

  admin_user = User.create!(
    user_name: "HappyPath",
    email: "happy@path.com",
    password: "password",
    admin: true
  )

  scenario 'non-admin signed in user does not see admin buttons' do
    sign_in user
    visit stop_index_path
    expect{page}.to_not have_content("All reviews")
    expect{page}.to_not have_content("New stop")
  end

  scenario 'not signed in user does not see admin buttons' do
    visit stop_index_path
    expect{page}.to_not have_content("All reviews")
    expect{page}.to_not have_content("New stop")
  end

  scenario 'admin signed in user sees admin buttons' do
    sign_in admin_user
    visit stop_index_path
    expect{page}.to have_content("All reviews")
    expect{page}.to have_content("New stop")
  end

end
