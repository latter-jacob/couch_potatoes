class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @reviews = @program.reviews
    @review = Review.new
  end
end
