require 'rails_helper'
require 'launchy'

feature 'user visits index page'  do
  scenario 'user sees stops' do

    first_stop = Stop.create(name: "eric")

    visit stops_path

    expect(page).to have_content(first_stop.name)
  end

end
