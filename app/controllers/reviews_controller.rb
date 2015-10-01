class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @program = Program.find(params[:program_id])
    @review = Review.new(review_params)

    if @review.save
      unless @program.user == nil
        UserMailer.review_notification(
          @program.user, current_user, @program
        ).deliver_now
      end
      flash[:notice] = "You have sumbitted a review"
      redirect_to program_path(@program)
    else
      flash[:errors] = @review.errors.full_messages.join(" - ")
      redirect_to program_path(@program)
    end
  end

  def edit
    @program = Program.find(params[:program_id])
    @review = Review.find(params[:id])
  end

  def update
    @program = Program.find(params[:program_id])
    @review = Review.find(params[:id])

    if current_user == @review.user
      if @review.update(review_params)
        flash[:notice] = "You have updated your review"
        redirect_to program_path(@program)
      else
        flash[:errors] = @review.errors.full_messages.join(" - ")
        redirect_to edit_program_review_path(@program, @review)
      end
    else
      flash[:error] = "You must be the original author to edit!"
      redirect_to program_path(@program)
    end
  end

  def destroy
    @program = Program.find(params[:program_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to program_path(@program)
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(
      program: @program,
      user: current_user
      )
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end
end
