class Api::V1::VotesController < ApplicationController

  def show
    if user_signed_in?
      vote = Review.find(params[:id]).votes.where(user_id: current_user.id)
    else
      vote = []
    end

    if vote == []
      @vote = nil
    else
      @vote = vote[0].vote_value
    end
    response = { vote: @vote }
    render json: response
  end

  def create
    current_review = Review.find(params[:review_id])

    if !user_signed_in?
      payload = render json: {
        vote: 0,
        upVotes: current_review[:up_votes],
        downVotes: current_review[:down_votes]
      }
      return payload
    end

    if params[:vote] == "up"
      click = 1
    else
      click = -1
    end

    current_vote = Review.find(params[:review_id]).votes.where(user_id: current_user.id)[0]

    if !current_vote
      current_vote = Vote.create(
        review_id: params[:review_id],
        user_id: current_user.id,
        vote_value: 0
      )
    end

    if click == current_vote[:vote_value]
      current_vote[:vote_value] = 0
      if click == 1
        current_review.decrement!(:up_votes)
      elsif click == -1
        current_review.decrement!(:down_votes)
      end
    elsif click > current_vote[:vote_value]
      current_review.increment!(:up_votes)
      if current_vote[:vote_value] == -1
        current_review.decrement!(:down_votes)
      end
      current_vote[:vote_value] = click
    else
      current_review.increment!(:down_votes)
      if current_vote[:vote_value] == 1
        current_review.decrement!(:up_votes)
      end
      current_vote[:vote_value] = click
    end

    current_vote.save!

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
