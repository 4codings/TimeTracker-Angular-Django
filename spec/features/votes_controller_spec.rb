require 'rails_helper'
require 'launchy'

RSpec.describe Api::V1::VotesController, type: :controller do


  describe "GET #show" do
    before(:each) do
      DatabaseCleaner.clean_with(:deletion)
      @valid_user = User.create!(
        user_name: "HappyPath",
        email: "happy@path.com",
        password: "password",
        admin: true
      )
      @new_stop = Stop.create!(
        name: "Stony Brook"
      )
      @new_review = Review.create!(
        rating: 4,
        body: "test test",
        stop_id: @new_stop.id,
        user_id: @valid_user.id
      )
      sign_in @valid_user
    end

    it "returns http success" do

      get :show, params: {id: @new_review.id}
      response.status.should eq(200)
    end

    it "returns correct vote value" do
      get :show, params: {id: @new_review.id}
      parsed = JSON.parse(response.body)
      expect(parsed["vote"]).to eq(nil)
    end
  end

  describe "POST #create" do
    before(:each) do
      DatabaseCleaner.clean_with(:deletion)
      @valid_user = User.create!(
        user_name: "HappyPath",
        email: "happy@path.com",
        password: "password",
        admin: true
      )
      @new_stop = Stop.create!(
        name: "Stony Brook"
      )
      @new_review = Review.create!(
        rating: 4,
        body: "test test",
        stop_id: @new_stop.id,
        user_id: @valid_user.id,
        up_votes: 1,
        down_votes: 1
      )
      sign_in @valid_user
    end

    it "returns correct values on upclick" do
      new_vote = Vote.create!(
        user_id: @valid_user.id,
        review_id: @new_review.id,
        vote_value: 0
      )
      post :create, params: {review_id: @new_review.id, vote: "up"}
      parsed = JSON.parse(response.body)
      expect(parsed["upVotes"]).to eq(2)
      expect(parsed["downVotes"]).to eq(1)
      expect(parsed["vote"]).to eq(1)
    end

    it "returns correct values on downclick" do
      new_vote = Vote.create!(
        user_id: @valid_user.id,
        review_id: @new_review.id,
        vote_value: 0
      )
      post :create, params: {review_id: @new_review.id, vote: "down"}
      parsed = JSON.parse(response.body)
      expect(parsed["upVotes"]).to eq(1)
      expect(parsed["downVotes"]).to eq(2)
      expect(parsed["vote"]).to eq(-1)
    end

    it "clears vote on repeated click" do
      new_vote = Vote.create!(
        user_id: @valid_user.id,
        review_id: @new_review.id,
        vote_value: 1
      )
      post :create, params: {review_id: @new_review.id, vote: "up"}
      parsed = JSON.parse(response.body)
      expect(parsed["upVotes"]).to eq(0)
      expect(parsed["downVotes"]).to eq(1)
      expect(parsed["vote"]).to eq(0)
    end

    it "flips vote on alternate click" do
      new_vote = Vote.create!(
        user_id: @valid_user.id,
        review_id: @new_review.id,
        vote_value: 1
      )
      post :create, params: {review_id: @new_review.id, vote: "down"}
      parsed = JSON.parse(response.body)
      expect(parsed["upVotes"]).to eq(0)
      expect(parsed["downVotes"]).to eq(2)
      expect(parsed["vote"]).to eq(-1)
    end
  end
end
