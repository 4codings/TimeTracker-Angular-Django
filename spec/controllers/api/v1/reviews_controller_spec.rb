require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "POST #create" do
    it "returns successfully with valid input" do
      new_stop = Stop.create(name: "Porter")
      post :create, params: {review:{rating:5, body:'wow'}, stop_id: new_stop.id}
      returned_json = JSON.parse(response.body)
      expect(response.content_type).to eq("application/json")
      expect(response.status).to eq(200)
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
    end

    it "returns unsuccessfully with invalid input" do
      new_stop = Stop.create(name: "Porter")
      post :create, params: {review:{body:'wow'}, stop_id: new_stop.id}
      returned_json = JSON.parse(response.body)
      expect(response.content_type).to eq("application/json")
      expect(response.status).to eq(200)
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(JSON.parse(response.body)['errors']).to eq("❌Rating can't be blank, ❌Rating is not included in the list, ❌User can't be blank")
    end
  end
end
