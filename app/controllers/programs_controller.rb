class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
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
    if current_admin.nil?
      redirect_to root_path
      flash[:notice] = "This portion of the site is for admins only!"
    else
      @program = Program.new
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
    if current_admin.nil?
      redirect_to root_path
      flash[:notice] = "This portion of the site is for admins only!"
    else
      @program = Program.find(params[:id])
    end
  end

  private

  def program_params
    params.require(:program).permit(:title, :url, :start_year, :end_year, :genre)
  end
end
