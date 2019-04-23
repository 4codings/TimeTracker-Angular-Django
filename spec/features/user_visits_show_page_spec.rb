require 'rails_helper'
require 'launchy'

feature 'user visits show page'  do
  scenario 'user sees the correct stop' do

    first_stop = Stop.create(name: "eric")
    second_stop = Stop.create(name: "Shard")

    visit stop_path(first_stop.id)


    expect(page).to have_content(first_stop.name)
    expect(page).to_not have_content(second_stop.name)
  end

end
