require 'rails_helper'
require 'launchy'

feature 'user visits show page'  do
  scenario 'user sees stops' do

    visit stops_path

    first_stop = Stop.create(name: "eric")

    expect(page).to_not have_content(first_stop)
  end

end
