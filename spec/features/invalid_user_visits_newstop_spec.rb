require 'rails_helper'

feature 'invalid user is blocked from new page'  do

  user = User.create(
    user_name: "SadPath",
    email: "sad@path.com",
    password: "password"
  )

  scenario 'user sees not found error' do
    expect{visit new_stop_path}.to raise_error
  end

end
