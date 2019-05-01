class Api::V1::VotesController < ApplicationController

  def show
    vote = Review.find(params[:id]).votes.where(user_id: current_user.id)
    if vote == []
      @vote = nil
    else
      @vote = vote[0].vote_value
    end
    response = { vote: @vote }
    render json: response
  end

  def create
    if params[:vote] == "up"
      vote = 1
    else
      vote = -1
    end

    current_review = Review.find(params[:review_id])
    current_vote = Review.find(params[:review_id]).votes.where(user_id: current_user.id)[0]

    if !current_vote
      current_vote = Vote.create(
        review_id: params[:review_id],
        user_id: current_user.id,
        vote_value: 0
      )
    end

    if vote == current_vote[:vote_value]
      current_vote[:vote_value] = 0
      if vote > 0
        current_review.decrement!(:up_votes)
      elsif vote < 0
        current_review.decrement!(:down_votes)
      end
    elsif vote > current_vote[:vote_value]
      current_review.increment!(:up_votes)
      current_review.decrement!(:down_votes) if current_vote[:vote_value] == -1
      current_vote[:vote_value] = vote
    else
      current_review.increment!(:down_votes)
      current_review.decrement!(:up_votes) if current_vote[:vote_value] == 1
      current_vote[:vote_value] = vote
    end

# DO WE NEED TO DO A SAVE TO WRITE ANY OF THIS TO DB?

    render json: {
      vote: current_vote[:vote_value],
      upVotes: current_review[:up_votes],
      downVotes: current_review[:down_votes]
    }

  end

 private
 def review_params
   params.require(:review).permit(:body, :rating)
 end

end
