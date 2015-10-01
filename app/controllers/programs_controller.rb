class ProgramsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search]
      @programs = Program.fuzzy_search(params[:search]).order("title DESC")
      @title_string = "Shows that match search: \"#{params[:search]}\""
    elsif params[:genre_id]
      @programs = Program.where(genre_id: params[:genre_id]).order(:title)
      genre_name = Genre.find(params[:genre_id]).name
      @title_string = "#{genre_name} shows"
    else
      @programs = Program.all.order(:title)
      @title_string = "All Programs"
    end
  end

  def show
    @program = Program.find(params[:id])
    @reviews = @program.reviews.order_by_vote.page params[:page]
    @review = Review.new
    @programs = Program.get_sidebar
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
    if current_user.admin?
      @program = Program.new
    else
      redirect_to root_path
      flash[:notice] = "This portion of the site is for admins only!"
    end
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
    if current_user.admin?
      @program = Program.find(params[:id])
    else
      redirect_to root_path
      flash[:notice] = "This portion of the site is for admins only!"
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to root_path
  end

  private

  def program_params
    params.require(:program).permit(
      :title, :url, :start_year, :end_year, :genre_id
    ).merge(
      user: current_user
    )
  end

  def require_admin
    unless current_user && current_user.admin
      flash[:error] = "This portion of the site is for admins only!"
      redirect_to root_path
    end
  end
end
