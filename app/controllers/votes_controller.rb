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
    @review = Review.find(params["review_id"])
    @vote = @review.votes.find_or_create_by(user: current_user)
    @vote.update_value(params["vote"])
    @vote_state = @vote.vote_state

    respond_to do |format|
      format.html { redirect_to :back }
      format.json do
        render json: { score: @review.get_score, vote_state: @vote_state }
      end
    end
  end
end
