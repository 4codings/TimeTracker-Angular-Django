require 'rails_helper'

RSpec.describe Api::V1::StopsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      new_stop = Stop.create(name: "Porter")
      get :show, params: {id: new_stop.id}
      response.status.should eq(200)
    end

    it "returns the correct stop name" do
      new_stop = Stop.create(name: "Porter")
      get :show, params: {id: new_stop.id}
      parsed = JSON.parse(response.body)
      expect(parsed["stop"]["name"]).to have_content("Porter")
    end

    it "returns an associated review" do
      new_stop = Stop.create(name: "Porter")
      new_review = Review.create(rating: 4, body: "this is a wendys", stop_id: new_stop.id)
      get :show, params: {id: new_stop.id}
      parsed = JSON.parse(response.body)
      expect(parsed["reviews"][0]["body"]).to have_content("this is a wendys")
    end
  end
end
