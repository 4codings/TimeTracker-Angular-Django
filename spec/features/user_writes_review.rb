require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "POST #create" do
    it "returns successfully with valid input" do
      new_stop = Stop.create(name: "Porter")
      post :create, params: {review:{rating:5, body:'wow'}, stop_id: new_stop.id}
      response.status.should eq(200)
    end

    it "returns unsuccessfully with invalid input" do
      new_stop = Stop.create(name: "Porter")
      post :create, params: {review:{body:'wow'}, stop_id: new_stop.id}
      JSON.parse(response.body)['errors'].should eq("Rating can't be blank, Rating is not included in the list")
    end
  end
end
