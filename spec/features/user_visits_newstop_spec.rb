require 'rails_helper'

feature 'user visits new stop page'  do

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
