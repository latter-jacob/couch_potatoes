class ProgramsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @reviews = @program.reviews
    @review = Review.new
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      flash[:notice] = "Program saved"
      redirect_to program_path(@program)
    else
      flash[:notice] = @program.errors.full_messages.join(". ")
      render :new
    end
  end

  def new
    @program = Program.new
  end

  def update
    @program = Program.find(params[:id])

    if @program.update(program_params)
      flash[:notice] = "Program edited"
      redirect_to @program
    else
      flash[:notice] = @program.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def destroy
    if current_user.try(:admin?)
      @program = Program.find(params[:id])
      @program.destroy
      flash[:notice] = 'program deleted.'
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = "This portion of the site is for admins only!"
    end
  end

  private

  def program_params
    params.require(:program).permit(:title, :url, :start_year, :end_year, :genre)
  end

  def require_admin
    unless current_user && current_user.admin
      flash[:error] = "This portion of the site is for admins only!"
      redirect_to root_path
    end
  end
end
