require 'rails_helper'
require 'launchy'

feature 'user visits stops index page'  do
  scenario 'user sees stops' do

    first_stop = Stop.create(name: "Eric")
    second_stop = Stop.create(name: "Shard")

    visit stops_path

    expect(page).to have_content(first_stop.name)
    expect(page).to have_content(second_stop.name)
    expect(page).to have_link(nil, href: "/stops/#{first_stop.id}")
    expect(page).to have_link(nil, href: "/stops/#{second_stop.id}")

  end

end
