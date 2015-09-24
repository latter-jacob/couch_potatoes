class VotesController < ApplicationController
  def index
    @votes = Vote.all
    respond_to do |format|
      format.html
      format.json do
        stuff
        render json: [votes]
      end
    end
  end



  def create
    @vote = Vote.new
    @user = current_user
    @review = Review.find(params["review_id"])
    vote_value = nil

    if params["vote"] == "plus_button"
      vote_value = 1
    else
      vote_value = -1
    end

    @vote.vote = vote_value
    @vote.user = @user
    @vote.review = @review
    @vote.save!
    @review.update_score

    respond_to do |format|
      format.html { redirect_to :back }
      format.json do
        render json: { score: @review.score, vote_state: 1 }
      end
    end
  end
end
