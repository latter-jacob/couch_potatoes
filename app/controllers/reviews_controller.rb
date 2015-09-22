class ReviewsController < ApplicationController
  def create
    authenticate_user!
    @program = Program.find(params[:program_id])
    @user = current_user
    @review = Review.new(review_params)
    @review.program = @program
    @review.user = @user
    @review.score = 0

    if @review.save
      flash[:notice] = "You have sumbitted a review"
      redirect_to program_path(@program)
    else
      flash[:errors] = @review.errors.full_messages.join(" - ")
      redirect_to program_path(@program)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
