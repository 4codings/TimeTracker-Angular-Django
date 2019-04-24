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
      sleep(1)
      parsed = JSON.parse(response.body)
      expect(parsed["name"]).to eq("Porter")
    end
  end

end
