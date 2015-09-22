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
      flash[:notice] = "Fill out form correctly"
      render :new
    end

  end

  def new
    if current_admin.nil?
      redirect_to root_path
    else
    @program = Program.new
    end
  end

  private
  def program_params
    params.require(:program).permit(:title, :url, :start_year, :end_year, :genre)
  end
end
